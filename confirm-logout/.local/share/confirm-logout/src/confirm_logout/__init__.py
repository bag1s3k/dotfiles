from textual.app import App, ComposeResult
from textual.widgets import Button, Label
from textual.containers import Horizontal, Container


class ConfirmLogout(App[None]):
    CSS_PATH = "style.tcss"

    def on_mount(self) -> None:
        self.theme = "ansi-dark"

    def compose(self) -> ComposeResult:
        """TODO:"""

        yield Container(
            Label("Do you want to log out?"),
            Horizontal(
                Button("Yes", variant="warning", id="yes-btn"),
                Button("No", variant="primary", id="no-btn"),
            ),
        )


def main() -> None:
    app = ConfirmLogout()

    app.run()


if __name__ == "__main__":
    main()
