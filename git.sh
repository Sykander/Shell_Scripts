# Aliases
alias g="git";
alias ga="git add";
alias gaa="git add -A";
alias gc="git commit";
alias gp="git pull";
alias gs="git add -A; git stash";
alias gm="git merge";

# Functions
gd() {
    if [ -z "$2" ]; then
      2='';
    fi

    if [ -z "$1" ]; then
      git diff;
    else
      git diff HEAD~$1 HEAD~$2;
    fi
}
