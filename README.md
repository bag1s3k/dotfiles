# Dotfiles

My personal configuration of my Fedora + Hyprland setup with bunch of other apps
using [GNU Stow](https://www.gnu.org/software/stow/).

## Packages
<!-- TABLE:START -->
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
