from textual.app import App, ComposeResult
from textual.binding import Binding
from textual.widgets import Button, Label
from textual.containers import Container
from textual.screen import Screen
import tomllib
from pathlib import Path
from dataclasses import dataclass
from enum import Enum
import asyncio


class Theme(str, Enum):
    """Supported Textual theme names."""

    ANSI_DARK = "ansi-dark"
    ANSI_LIGHT = "ansi-light"
    ATOM_ONE_DARK = "atom-one-dark"
    ATOM_ONE_LIGHT = "atom-one-light"
    CATPPUCCIN_FRAPPE = "catppuccin-frappe"
    CATPPUCCIN_LATTE = "catppuccin-latte"
    CATPPUCCIN_MACCHIATO = "catppuccin-macchiato"
    CATPPUCCIN_MOCHA = "catppuccin-mocha"
    DRACULA = "dracula"
    FLEXOKI = "flexoki"
    GRUVBOX = "gruvbox"
    MONOKAI = "monokai"
    NORD = "nord"
    ROSE_PINE = "rose-pine"
    ROSE_PINE_DAWN = "rose-pine-dawn"
    ROSE_PINE_MOON = "rose-pine-moon"
    SOLARIZED_DARK = "solarized-dark"
    SOLARIZED_LIGHT = "solarized-light"
    TEXTUAL_DARK = "textual-dark"
    TEXTUAL_LIGHT = "textual-light"
    TOKYO_NIGHT = "tokyo-night"


@dataclass
class Config:
    """Logout command and user preferences loaded from TOML."""

    cmd: str
    default_cancel: bool = False
    vim_keys: bool = False
    short_cuts: bool = True
    theme: Theme = Theme.ANSI_DARK

    def __post_init__(self):
        """Validate the logout command and convert the theme to a Theme member."""
        if not isinstance(self.cmd, str):
            raise TypeError("cmd must be a string")

        if not self.cmd.strip():
            raise ValueError("cmd cannot be empty")

        self.theme = Theme(self.theme)


class Backgound(App[None]):
    """Host confirmation and error screens with shared application settings."""

    def __init__(self, initial_screen: Screen, theme: Theme):
        """Initialize the app with its starting screen and theme."""
        super().__init__()
        self.initial_screen: Screen = initial_screen
        self.theme = theme.value

    CSS_PATH = "style.tcss"

    BINDINGS = [Binding("escape,q", "quit", "Close menu", priority=True)]

    def on_mount(self) -> None:
        """Show the initial screen using the selected theme."""
        self.app.theme = self.theme
        self.push_screen(self.initial_screen)


class ShowError(Screen):
    """Display an error message in place of the confirmation menu."""

    def __init__(self, msg: str):
        """Store the error message to display."""
        super().__init__()
        self.error_msg = msg

    def compose(self) -> ComposeResult:
        """Build the label containing the error message."""
        yield Label(self.error_msg, id="error_msg")


class ConfirmLogout(Screen):
    """Confirm logout and handle button selection and command execution."""

    def __init__(self, config: Config):
        """Initialize the confirmation screen with the user's configuration."""
        super().__init__()
        self.config: Config = config

    BINDINGS = [
        Binding("h,l", "vim_focus_btn", "Switch button focus", priority=True),
        Binding("left,right", "focus_btn", "Switch button focus", priority=True),
        Binding("y", "press_btn(True)", "Confirm logout", priority=True),
        Binding("n", "press_btn(False)", "Cancel logout", priority=True),
    ]

    def compose(self) -> ComposeResult:
        """Build the logout prompt with Yes and No buttons."""

        yield Container(
            Label("Do you want to log out?"),
            Button("Yes", variant="warning", id="yes-btn"),
            Button("No", variant="primary", id="no-btn"),
        )

    def on_mount(self) -> None:
        """Focus the default button selected by the configuration."""
        selector = "#no-btn" if self.config.default_cancel else "#yes-btn"
        self.query_one(selector, Button).focus()

    def action_focus_btn(self) -> None:
        """Toggle focus between the Yes and No buttons."""
        btn = self.query_one("#yes-btn", Button)

        if self.focused is btn:
            self.query_one("#no-btn", Button).focus()
        else:
            self.query_one("#yes-btn", Button).focus()

    async def on_button_pressed(self, event: Button.Pressed) -> None:
        """Pass the pressed button's confirmation choice to the shared action."""
        if event.button.id == "yes-btn":
            await self.action_press_btn(True)
            return
        else:
            self.app.exit()

    async def action_press_btn(self, btn: bool) -> None:
        """Close the menu on cancellation or run the configured logout command.

        Show an error screen if the command returns a nonzero exit code.
        """
        if not btn:
            self.app.exit()
            return

        process = await asyncio.create_subprocess_exec(
            "sh",
            "-c",
            self.config.cmd,
            stdout=asyncio.subprocess.DEVNULL,
            stderr=asyncio.subprocess.PIPE,
        )

        _, stderr = await process.communicate()

        if process.returncode != 0:
            error = stderr.decode(errors="replace").strip() or (
                f"Command failed with exit code {process.returncode}."
            )

            self.app.switch_screen(ShowError(error))

    def check_action(self, action: str, parameters: tuple[object, ...]) -> bool:
        """Enable optional keyboard actions according to the configuration."""
        if action == "vim_focus_btn":
            return self.config.vim_keys

        if action == "press_btn":
            return self.config.short_cuts

        return True

    def action_vim_focus_btn(self) -> None:
        """Toggle button focus using the Vim key bindings."""
        self.action_focus_btn()


def main() -> None:
    """Load configuration and launch the appropriate screen and theme."""
    path = Path.home() / ".config" / "confirm-logout" / "config.toml"

    theme = Theme.ANSI_DARK

    try:
        data = None
        with open(path, "rb") as f:
            data = tomllib.load(f)

        config = Config(**data["general"])
        theme = config.theme
        initial_screen = ConfirmLogout(config)
    except Exception as e:
        initial_screen = ShowError(str(e))

    Backgound(initial_screen, theme).run()


if __name__ == "__main__":
    main()
