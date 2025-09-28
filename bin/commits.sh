#!/bin/sh

CHOICE=$(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore")
SCOPE=$(gum input --placeholder "scope")
test -n "$SCOPE" && SCOPE="($SCOPE)"

SUMMARY=$(gum input --placeholder "summary of this change")
DESCRIPTION=$(gum write --placeholder "description of this change")

gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"
