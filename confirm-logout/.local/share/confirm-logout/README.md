# confirm-logout

A small terminal app built with `Python` and `Textual`. It asks you to confirm before
you log out. The **Yes** and **No** buttons help you avoid logging out by mistake.

## Installation

### Install a release

```sh
curl -fsSL https://raw.githubusercontent.com/bag1s3k/dotfiles/main/confirm-logout/.local/share/confirm-logout/install.sh | sh
```

You can also choose a version. e.g. `confirm-logout-v2026.0.0`

```sh
curl -fsSL https://raw.githubusercontent.com/bag1s3k/dotfiles/main/confirm-logout/.local/share/confirm-logout/install.sh | sh -s -- confirm-logout-v2026.0.0
```

The installer installs the app to
`~/.local/bin/confirm-logout`. It keeps your config file.
Add `~/.local/bin` to your `PATH` and create the config file shown below.

### Run from source

For this option, you need Python **3.13 or newer**, `uv`, and a terminal.

Open the project folder in your dotfiles and install the Python packages:

```sh
cd ~/dotfiles/confirm-logout/.local/share/confirm-logout
uv sync
```

Before using the menu, create the config file shown below.

### Build an executable

You can also build a single executable file with PyInstaller. You need `just`
for the build command. PyInstaller is included in the project's development packages.

```sh
just build
install -Dm755 dist/confirm-logout ~/.local/bin/confirm-logout
```

Add `~/.local/bin` to your `PATH` if you want to run `confirm-logout` from any folder.

## Configuration

The app reads its settings from `~/.config/confirm-logout/config.toml`.
Create the folder if it does not exist:

```sh
mkdir -p ~/.config/confirm-logout
```

Copy this example into `config.toml`. Change `cmd` to your logout command or the
path to a logout script. The script must be executable if you run it by its path.

```toml
[general]
cmd = "your-logout-command"
default_cancel = true
vim_keys = false
short_cuts = true
theme = "ansi-dark"
```

Put all options in the `[general]` section:

| Option           | Type    | Default       | Description                                                 |
| ---------------- | ------- | ------------- | ----------------------------------------------------------- |
| `cmd`            | String  | Required      | Command to run when you choose **Yes**. It cannot be empty. |
| `default_cancel` | Boolean | `false`       | Select **No** when `true`, or **Yes** when `false`.         |
| `vim_keys`       | Boolean | `false`       | Allow `h` and `l` to switch between buttons.                |
| `short_cuts`     | Boolean | `true`        | Allow `y` to confirm and `n` to cancel.                     |
| `theme`          | String  | `"ansi-dark"` | Color theme for the app.                                    |

The example uses `default_cancel = true`. This selects **No** when the menu opens,
so pressing Enter closes the menu without running the logout command.

The app runs `cmd` through `sh -c`. You can include arguments and shell operators
such as `&&`. You must set the logout command yourself. If the config file is
missing or has invalid settings, the app shows an error screen.

<details>
    <summary>Available themes</summary>

- **ANSI:** `ansi-dark`, `ansi-light`
- **Atom One:** `atom-one-dark`, `atom-one-light`
- **Catppuccin:** `catppuccin-frappe`, `catppuccin-latte`, `catppuccin-macchiato`, `catppuccin-mocha`
- **Dracula:** `dracula`
- **Flexoki:** `flexoki`
- **Gruvbox:** `gruvbox`
- **Monokai:** `monokai`
- **Nord:** `nord`
- **Rosé Pine:** `rose-pine`, `rose-pine-dawn`, `rose-pine-moon`
- **Solarized:** `solarized-dark`, `solarized-light`
- **Textual:** `textual-dark`, `textual-light`
- **Tokyo Night:** `tokyo-night`

</details>

## Usage

Run the app from the project folder:

```sh
uv run confirm-logout
```

If you used the installer or built and installed the executable, run:

```sh
confirm-logout
```

You can set a keyboard shortcut in your window manager to open a terminal and
start the app.

| Key          | Action                                      |
| ------------ | ------------------------------------------- |
| Left / Right | Switch between **Yes** and **No**.          |
| Enter        | Press the selected button.                  |
| `h` / `l`    | Switch buttons when `vim_keys = true`.      |
| `y`          | Confirm logout when `short_cuts = true`.    |
| `n`          | Cancel when `short_cuts = true`.            |
| Esc / `q`    | Close the menu without running the command. |

Choose **Yes** to run your logout command, or **No** to close the menu.
If the command returns an exit code other than `0`, the app shows its error message.
If there is no error message, it shows the exit code. Press Esc or `q` to close
the error screen.
