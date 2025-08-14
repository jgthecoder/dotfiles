# Only run this file inside Zsh
if [ -n "$ZSH_VERSION" ]; then
  # zoxide


  # Git diff with delta
  if command -v delta >/dev/null 2>&1; then
    git config --global core.pager delta
  fi

  # Replace find with fd
  if command -v fd >/dev/null 2>&1; then
    alias find='fd'
  fi

  # Use dust instead of du
  if command -v dust >/dev/null 2>&1; then
    alias du='dust'
  fi

  # Use procs instead of ps
  if command -v procs >/dev/null 2>&1; then
    alias ps='procs'
  fi

  # Completion system
  zsh_lazy_compinit() {
    autoload -Uz compinit && compinit -d "$ZDOTDIR/.zcompdump"
    unfunction zsh_lazy_compinit
  }

  zle -N zsh_lazy_compinit
  bindkey '^I' zsh_lazy_compinit

  # Keybindings
  bindkey -v  # vi mode

  autoload -Uz edit-command-line
  zle -N edit-command-line
  bindkey -M vicmd v edit-command-line


  # Syntax highlighting
  HIGHLIGHTING="$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  [ -f "$HIGHLIGHTING" ] && source "$HIGHLIGHTING"

  # Autosuggestions
  AUTOSUGGESTIONS="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  [ -f "$AUTOSUGGESTIONS" ] && source "$AUTOSUGGESTIONS"

  # pnpm
  export PNPM_HOME="$HOME/Library/pnpm"
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac


  source "$HOME/.config/local/share/cargo/env"

  eval "$(direnv hook zsh)"
fi
