# dotfiles

My personal system configuration. Includes terminal settings, aliases, editor
config, and basic setup scripts.

## Contents

- `zshrc`: shell aliases, functions, paths
- `gitconfig`: Git settings and shortcuts
- `vimrc`: Vim config (or use Neovim under `.config/nvim`)
- `setup.sh`: setup script for fresh machines

## Usage

```bash
git clone https://github.com/yourusername/dotfiles.git
cd dotfiles
bash setup.sh
```

## Apps

- Rectangle
- Raycast
- Shottr
- F.lux -> remove blue light from your screen at night

## Chrome Extensions

- Dark Reader
- ImproveTube
- 1Password
- Adblock for Youtube
- PrintFriendly

## Neovim

### Plugin Manager
- lazy.nvim


## Stow

### Install with stow

```sh
stow --target $HOME/.config .
```

### Homebrew installation

Leaving a machine
`brew leaves > leaves.txt`

Fresh install
`xargs brew install < leaves.txt`
>>>>>>> cdfa099 (Miscellaneous changes)
