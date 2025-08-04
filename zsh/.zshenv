# Change the default config location
if [[ -z "$XDG_CONFIG_HOME" ]]; then
	export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -z "$XDG_CACHE_HOME" ]]; then
	export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
fi

if [ ! -d "$XDG_CONFIG_HOME/zsh" ]; then
  mkdir -p "$XDG_CONFIG_HOME/zsh"
fi

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"


export EDITOR="vim"
export VISUAL="$EDITOR"
export PAGER="less"
export TERM=xterm-256color

export HOMEBREW_NO_AUTO_UPDATE=1
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export STARSHIP_CACHE="$XDG_CACHE_HOME/starship/cache"

. "/Users/Joshua/.local/share/bob/env/env.sh"
. "$HOME/.cargo/env"
