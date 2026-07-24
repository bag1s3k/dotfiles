# Dotfiles

My personal configuration of my Fedora + Hyprland setup with bunch of other apps
using [GNU Stow](https://www.gnu.org/software/stow/).

## Packages
<!-- TABLE:START -->

| App | Last update | Description of Update |
| --- | ----------- | --------------------- |
| bashrc | 2026-07-24 20:18:31 | fix(gitignore): don't ignore only README in the root |
| fastfetch | 2026-07-24 20:18:31 | fix(gitignore): don't ignore only README in the root |
| fish | 2026-07-24 20:18:31 | fix(gitignore): don't ignore only README in the root |
| gitconfig | 2026-07-24 20:18:31 | fix(gitignore): don't ignore only README in the root |
| gtk-3.0 | 2026-07-24 20:18:31 | fix(gitignore): don't ignore only README in the root |
| gtk-4.0 | 2026-07-24 20:18:31 | fix(gitignore): don't ignore only README in the root |
| hypr | 2026-07-24 20:18:31 | fix(gitignore): don't ignore only README in the root |
| kitty | 2026-07-24 20:18:31 | fix(gitignore): don't ignore only README in the root |
| nvim | 2026-07-24 20:18:31 | fix(gitignore): don't ignore only README in the root |
| rofi | 2026-07-24 20:18:31 | fix(gitignore): don't ignore only README in the root |
| starship | 2026-07-24 20:18:31 | fix(gitignore): don't ignore only README in the root |
| swaync | 2026-07-24 20:18:31 | fix(gitignore): don't ignore only README in the root |
| vim | 2026-07-24 20:18:31 | fix(gitignore): don't ignore only README in the root |
| waybar | 2026-07-24 20:18:31 | fix(gitignore): don't ignore only README in the root |
| zshrc | 2026-07-24 20:18:31 | fix(gitignore): don't ignore only README in the root |

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
