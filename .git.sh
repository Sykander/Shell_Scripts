# Aliases
alias g="git";
alias ga="git add";
alias gaa="git add -A";
alias gc="git commit";
alias gch="git checkout";
alias gd="git diff";
alias gdc="git diff --cached";
alias gm="git merge";
alias gl="git log";
alias gp="git pull";
alias gr="git reset";
alias gs="git status";
alias gstash="git add -A; git stash"; # Ensures untracked files are also stashed

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

# Rename a file regardless of case sensitivity
# @param target
# @param destination
grename() {
    git mv $1 ${sh}/temp_file && git mv ${sh}/temp_file $2;
}
