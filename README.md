# Dotfiles

My personal configuration of my Fedora + Hyprland setup with bunch of other apps
using [GNU Stow](https://www.gnu.org/software/stow/).

## Packages
<!-- TABLE:START -->

| App | Last update | Description of Update |
| --- | ----------- | --------------------- |
| bashrc | 2026-06-18 20:16 | Initial commit: My hyprpald & CLI setup |
| clipse | 2026-07-30 12:12 | Make clipse window more minimalistic |
| fastfetch | 2026-08-03 22:50 | Hide unnecessary informations to align text with distro logo |
| fish | 2026-07-25 00:39 | Change time format to %Y-%d-%m |
| gitconfig | 2026-08-03 12:51 | Enable fsmonitor |
| gtk-3.0 | 2026-06-18 20:16 | Initial commit: My hyprpald & CLI setup |
| gtk-4.0 | 2026-06-18 20:16 | Initial commit: My hyprpald & CLI setup |
| hypr | 2026-07-30 00:48 | Add clipse clipboard manager integration |
| kitty | 2026-08-03 22:52 | Update kitty bright color palette |
| nvim | 2026-07-30 16:17 | Change autocomplete bind to <super-tab> instead of <Enter> |
| rofi | 2026-06-18 20:16 | Initial commit: My hyprpald & CLI setup |
| starship | 2026-08-03 23:10 | Remove space added by mistake |
| swaync | 2026-06-18 22:10 | refactor: remove unnecesary code/comments |
| vim | 2026-06-18 20:16 | Initial commit: My hyprpald & CLI setup |
| waybar | 2026-07-31 00:05 | Remove underline status bar cause it's useless and inconsistent |
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
