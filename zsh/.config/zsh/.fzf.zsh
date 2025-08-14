# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/Joshua/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/Joshua/.fzf/bin"
fi

source <(fzf --zsh)
