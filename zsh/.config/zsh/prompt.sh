# Starship prompt
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# PROMPT='%(?.%F{green}✓%f.%F{red}✗%f) %F{blue}%2~%f %F{red}$(git_branch_status)%f%(!.#.%F{179}$%f) '

# Set the right prompt to the vcs_info message
# RPROMPT='%F{8}⏱ %*%f'



