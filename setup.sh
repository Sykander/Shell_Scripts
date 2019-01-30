setup() {
    if [[ -d ~/.shell_scripts ]]; then
        cd ~/.shell_scripts
        git remote update;
        if ! git status -uno | grep -q 'up to date'
        then
            update;
        fi
        cd -
    else
        install;
    fi
}

update() {
    message "It looks like a version of shell_scripts is already installed.\n  Would you like to update to the latest version?" "[y, n]";
    read update
    if [[ $update = 'y' ]] || [[ $update = 'yes' ]] || [[ $update = 'Y' ]]; then
        cd ~/.shell_scripts
        git checkout master
        git pull
        if [[ -z $sh ]]; then
            message "Append the following line to your Bash Profile \n source ~/.shell_scripts/main.sh;";
        else
            message "Update Complete.";
        fi
        cd -;
    fi
}

install() {
    git clone https://github.com/Sykander/Shell_Scripts.git ~/.shell_scripts;
    message "Append the following line to your Bash Profile \n source ~/.shell_scripts/main.sh;";
}

message() {
    if [[ -z "$1" ]]; then
      printf "\n ==================== \n\n\n";
    fi

    if [[ -z "$2" ]]; then
      printf "\n ==================== \n\n\n ${1}"
    fi

    if [[ -z "$3" ]]; then
      printf "\n ==================== \n\n\n ${1} ${2}:"
    fi
}

setup
