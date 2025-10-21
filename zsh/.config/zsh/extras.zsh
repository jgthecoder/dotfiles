#!/usr/bin/env zsh

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(zoxide init zsh --cmd cd)"

# fzf setup (basic)
if [ -f "$HOME/.fzf.zsh" ]; then
    source "$HOME/.fzf.zsh"
fi

source <(fzf --zsh)
bindkey "ç" fzf-cd-widget
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
--walker-skip .git,node_modules,target
--preview 'bat -n --color=always {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'"

bindkey -v  # vi mode

# edit longer commands in vim buffer
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source "$HOME/.config/local/share/cargo/env" # Rust
# eval "$(direnv hook zsh)" # Direnv


lazy_load_nvm() {
  unset -f node nvm
  export NVM_DIR=~/.nvm
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
}

node() {
  lazy_load_nvm
  node $@
}

nvm() {
  lazy_load_nvm
  node $@
}

