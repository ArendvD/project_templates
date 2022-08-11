# Custom aliases

# OS
alias cd..="cd .."

# Git
alias gc="git commit -m"
alias gcno="git commit --no-verify"
alias ga="git add"
alias gpo="git push origin"
alias gs="git status"
alias gb="git branch"

# Prune merged git branches
prunegit() {
    TARGET_BRANCH="${1:-develop}"
    echo "Cleaning branches merged into $TARGET_BRANCH"
    git fetch --prune
    git branch -d $(git branch --merged="$TARGET_BRANCH" | grep -v -e "$TARGET_BRANCH" -e main -e master)
}

# Conda
alias sa="source activate"
alias sd="conda deactivate"
