from textual.app import App, ComposeResult
from textual.binding import Binding
from textual.widgets import Button, Label
from textual.containers import Container
import subprocess


class ConfirmLogout(App[None]):
    CSS_PATH = "style.tcss"

    BINDINGS = [
        Binding("escape,q", "quit", "Close menu", priority=True),
        Binding("left,right,h,l", "focus_btn", "Switch button focus", priority=True),
        Binding("y", "press_btn(True)", "Confirm logout", priority=True),
        Binding("n", "press_btn(False)", "Cancel logout", priority=True),
    ]

    AUTO_FOCUS = "#no-btn"

    def compose(self) -> ComposeResult:
        """Build the logout prompt with Yes and No buttons."""

        yield Container(
            Label("Do you want to log out?"),
            Button("Yes", variant="warning", id="yes-btn"),
            Button("No", variant="primary", id="no-btn"),
        )

    def on_mount(self) -> None:
        """Apply the ANSI dark theme when the app is mounted."""
        self.theme = "ansi-dark"

    def action_focus_btn(self) -> None:
        """Toggle focus between the Yes and No buttons."""
        btn = self.query_one("#yes-btn", Button)

        if self.focused is btn:
            self.query_one("#no-btn", Button).focus()
        else:
            self.query_one("#yes-btn", Button).focus()

    def on_button_pressed(self, event: Button.Pressed) -> None:
        """Pass the pressed button's confirmation choice to the shared action."""
        if event.button.id == "yes-btn":
            self.action_press_btn(True)
        else:
            self.action_press_btn(False)

    def action_press_btn(self, press_btn: bool) -> None:
        """Launch the logout command on confirmation, or close the menu on cancellation."""
        if press_btn:
            subprocess.Popen(
                [
                    "sh",
                    "-c",
                    "...",  # TODO: placeholder fo the command to execute
                ]
            )
        else:
            self.exit()


def main() -> None:
    app = ConfirmLogout()

    app.run()


if __name__ == "__main__":
    main()
