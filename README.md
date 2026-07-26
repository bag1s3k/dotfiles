# Dotfiles

My personal configuration of my Fedora + Hyprland setup with bunch of other apps
using [GNU Stow](https://www.gnu.org/software/stow/).

## Packages
<!-- TABLE:START -->

| App | Last update | Description of Update |
| --- | ----------- | --------------------- |
| bashrc | 2026-06-18 20:16 | Initial commit: My hyprpald & CLI setup |
| fastfetch | 2026-06-18 22:10 | refactor: remove unnecesary code/comments |
| fish | 2026-07-25 00:39 | Change time format to %Y-%d-%m |
| gitconfig | 2026-07-24 22:49 | Enable GitHub commit verification using SSH key |
| gtk-3.0 | 2026-06-18 20:16 | Initial commit: My hyprpald & CLI setup |
| gtk-4.0 | 2026-06-18 20:16 | Initial commit: My hyprpald & CLI setup |
| hypr | 2026-07-26 12:19 | Add binds to resize window using keyboard |
| kitty | 2026-06-18 20:16 | Initial commit: My hyprpald & CLI setup |
| nvim | 2026-07-26 12:16 | Install 'windwp/autopairs' plugin |
| rofi | 2026-06-18 20:16 | Initial commit: My hyprpald & CLI setup |
| starship | 2026-06-18 22:10 | refactor: remove unnecesary code/comments |
| swaync | 2026-06-18 22:10 | refactor: remove unnecesary code/comments |
| vim | 2026-06-18 20:16 | Initial commit: My hyprpald & CLI setup |
| waybar | 2026-06-18 20:16 | Initial commit: My hyprpald & CLI setup |
| zshrc | 2026-06-18 20:16 | Initial commit: My hyprpald & CLI setup |

<!-- TABLE:END -->

## Installation

- install [GNU Stow](https://www.gnu.org/software/stow/)
- Clone repo 

```bash
git clone https://github.com/bag1s3k/dotfiles.git ~/dotfiles
```

### Usage

Symlink for specific package (e.g `vim`):

```bash
stow vim
```

To symlink all packages in once:

```bash
stow */
```

### Removing symlink

```bash
stow -D zsh
```
