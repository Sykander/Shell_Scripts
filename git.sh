# Aliases
alias g="git";
alias ga="git add";
alias gaa="git add -A";
alias gc="git commit";
alias gp="git pull";
alias gs="git add -A; git stash"; # Ensures untracked files are also stashed
alias gm="git merge";
alias gd="git diff";

# Functions

# git diffs two commits based on their integer distance from the HEAD
# @param distance to commit being compared to
# @param distance to commit being compared from (default is the HEAD)
glb() {
    if [ -z "$2" ]; then
        2=0;
    fi

    if [ -z "$1" ]; then
      git diff;
    else
      git diff HEAD~$1 HEAD~$2;
    fi
}
