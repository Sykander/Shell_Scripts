# Aliases
alias g="git";
alias ga="git add";
alias gaa="git add -A";
alias gc="git commit";
alias gp="git pull";
alias gstash="git add -A; git stash"; # Ensures untracked files are also stashed
alias gr="git reset";
alias gch="git checkout";
alias gm="git merge";
alias gd="git diff";
alias gs="git status";
alias gl="git log";

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

# makes a patch file of all changes (including untracked files) since the current head located at $sh/patches/
# @param name for patch file, the current date time will be used if none is provided
gpatch() {
    git add -A;

    if [ ! -d ${sh}/patches ]; then
        mkdir ${sh}/patches
    fi

    if [ -z "$1" ]; then
        1=`date '+%Y-%m-%d-%H-%M-%S'`
    fi

    git diff --cached > ${sh}/patches/${1}.patch
    git reset
}
