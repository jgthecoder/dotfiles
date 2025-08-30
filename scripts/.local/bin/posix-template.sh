#!/bin/sh

# POSIX-compliant shell script template
# Compatible with: sh, dash, ksh, bash --posix

# --- Strict mode ---
set -eu  # Exit on error or undefined variable
IFS=$(printf ' \t\n_'); IFS=${IFS%_}  # Clean IFS

# --- Config ---
SCRIPT_NAME=$(basename "$0")
VERSION="1.0.0"

# --- Logging ---
log_info()  { printf '[INFO] %s\n' "$*"; }
log_warn()  { printf '[WARN] %s\n' "$*" >&2; }
log_error() { printf '[ERROR] %s\n' "$*" >&2; }

# --- Usage ---
usage() {
    cat <<EOF
Usage: $SCRIPT_NAME [options] arg1 arg2 ...
Options:
  -h        Show this help message
  -v        Show version
EOF
}

# --- Error exit ---
die() {
    log_error "$*"
    exit 1
}

# --- Parse arguments ---
show_help=false
show_version=false

while [ $# -gt 0 ]; do
    case $1 in
        -h) show_help=true ;;
        -v) show_version=true ;;
        --) shift; break ;;
        -*) die "Unknown option: $1" ;;
         *) break ;;
    esac
    shift
done

if $show_help; then
    usage
    exit 0
fi

if $show_version; then
    printf '%s version %s\n' "$SCRIPT_NAME" "$VERSION"
    exit 0
fi

# --- Main logic ---
if [ $# -eq 0 ]; then
    die "No arguments provided"
fi

for arg in "$@"; do
    log_info "Processing: $arg"
    # Example action: check if file exists
    if [ -f "$arg" ]; then
        lines=$(wc -l < "$arg")
        log_info "$arg has $lines lines"
    else
        log_warn "$arg is not a file"
    fi
done
