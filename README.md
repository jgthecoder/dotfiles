# My Dotfiles

This repository contains my personal configuration files (dotfiles) managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

1. Clone this repository to your home directory:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   ```

2. Navigate to the dotfiles directory:
   ```bash
   cd ~/dotfiles
   ```

3. Use Stow to create symlinks for specific packages:
   ```bash
   stow --ignore=.DS_Store zsh
   stow --ignore=.DS_Store git
   stow --ignore=.DS_Store vim
   ```

   Or install all packages at once:
   ```bash
   stow --ignore=.DS_Store */
   ```

## Structure

Each subdirectory represents a "package" that contains related configuration files:

- `zsh/` - Zsh shell configuration
- `git/` - Git configuration
- `vim/` - Vim/Neovim configuration
- `tmux/` - Tmux configuration
- `ssh/` - SSH configuration (be careful with sensitive files)

## Usage

- To add a new package: `stow --ignore=.DS_Store package_name`
- To remove a package: `stow -D package_name`
- To restow (useful after updates): `stow -R package_name`

## Notes

- Files are symlinked to their expected locations in your home directory
- The `--ignore=.DS_Store` flag prevents macOS metadata files from being processed
- Always test stow operations with `-n` (dry run) first: `stow -n package_name`
