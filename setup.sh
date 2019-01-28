if [[ -d ~/.shell_scripts ]]; then
    printf '\n\n\n It looks like a version of shell_scripts is already installed.\n  Would you like to update to the latest version? [y,n]';
    read update
    if [[ $update = 'y' ]]; then
        cd ~/.shell_scripts
        g checkout master
        g pull
        if [[ -z $sh ]]; then
            printf "\n ==================== \n\n\n Append the following line to your Bash Profile \n source ~/.shell_scripts/main.sh;";
        else
            printf "\n ==================== \n\n\n Update complete";
        fi
        cd -;
    fi
else
    git clone https://github.com/Sykander/Shell_Scripts.git ~/.shell_scripts;
    printf "\n ==================== \n\n\n Append the following line to your Bash Profile \n source ~/.shell_scripts/main.sh;";
fi
