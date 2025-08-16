# Dotfiles

## Installation

1. Clone the repo.
```sh
git clone git@github.com:jgthecoder/dotfiles.git $HOME/dotfiles
```

2. Install homebrew.
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

> ![Note]
> Don't forget to run the commands at the end of the homebrew install!
> Otherwise, homebrew will not be added to your path!

3. Install the cli tools and casks from the Brewfile.
```sh
brew bundle --file="$HOME/dotfiles/Brewfile"
```

4. Stow the dotfiles repo
```sh
stow $HOME/dotfiles
```

