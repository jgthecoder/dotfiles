#!/usr/bin/env zsh

# Create and enter directory
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Extract common archive types
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.gz|*.tgz) tar -xzf "$1" ;;
      *.tar.bz2)      tar -xjf "$1" ;;
      *.tar.xz)       tar -xJf "$1" ;;
      *.zip)          unzip "$1" ;;
      *.rar)          unrar x "$1" ;;
      *) echo "Cannot extract '$1'" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Timer (basic stopwatch)
timer() {
  start=$(date +%s)
  echo "Press enter to stop"
  read _
  end=$(date +%s)
  echo "$((end - start))s elapsed"
}

# Create file and open in editor
touchedit() {
  touch "$1" && ${EDITOR:-vi} "$1"
}

# Show size of directories (sorted)
ducks() {
  du -sh ./* 2>/dev/null | sort -hr
}

# Find file by name
ff() {
  find . -type f -iname "*$1*"
}

# Reload config
reload() {
  source "$ZDOTDIR/.zshrc" && echo "Reloaded .zshrc"
}

# git_branch_status() {
#   git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return
#
#   branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return
#   unstaged_status=$(git diff --shortstat 2>/dev/null)
#   staged_status=$(git diff --cached --shortstat 2>/dev/null)
#
#   added=$(echo "$unstaged_status $staged_status" | grep -oE '[0-9]+ insert' | awk '{s+=$1} END {print s+0}')
#   removed=$(echo "$unstaged_status $staged_status" | grep -oE '[0-9]+ delet' | awk '{s+=$1} END {print s+0}')
#
#   printf '(%s' "$branch"
#   [ "$added" -ne 0 ] && printf ' +%s' "$added"
#   [ "$removed" -ne 0 ] && printf ' -%s' "$removed"
#   printf ') '
# }

# Run this from your zsh config (e.g., sourced from ~/.config/zsh/extras/functions.zsh)
docker-ubuntu() {
  local action="$1"
  local container_name="${2:-nautilus}"
  local image_name="ubuntu"

  case "$action" in
    build)
      CONTAINER_NAME="$container_name" docker build \
        --build-arg CONTAINER_NAME="$container_name" \
        -t "$image_name" .
      ;;
    run)
      docker run --name "$container_name" \
        -e CONTAINER_NAME="$container_name" \
        -it "$image_name"
      ;;
    shell)
      docker exec -it "$container_name" zsh
      ;;
    start)
      docker start -ai "$container_name"
      ;;
    stop)
      docker stop "$container_name"
      ;;
    remove)
      docker rm "$container_name"
      ;;
    *)
      echo "Usage: docker-ubuntu {build|run|shell|start|stop|remove} [container_name]"
      ;;
  esac
}
