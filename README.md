![preview](./docs/_media/demo.webp)

# Dotfiles | Fedora & Hyprland

My personal configuration of my Fedora + Hyprland setup with bunch of other apps
using [GNU Stow](https://www.gnu.org/software/stow/).

> [!NOTE]
> The setup is made to balance performance and battery life, because I sometimes
> use my laptop while it is plugged in and sometimes on battery.

## Installation

> [!IMPORTANT]
> The package directory itself represents the **home** directory. \
> `package/.config/package/...` == `$HOME/.config/package/...` \
> In the other words, `package` is only the name of the **Stow** package.

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
