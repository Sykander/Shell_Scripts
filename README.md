# Installation

Run the following command to install this package

```
setup(){ if [[ -d ~/.shell_scripts ]];then cd ~/.shell_scripts;git remote update;if ! git status -uno|grep -q 'up to date';then update;fi;cd -;else install;fi;};update(){ message "It looks like a version of shell_scripts is already installed.\n  Would you like to update to the latest version?" "[y, n]";read update;if [[ $update = 'y' ]]||[[ $update = 'yes' ]]||[[ $update = 'Y' ]];then cd ~/.shell_scripts;git checkout master;git pull;if [[ -z $sh ]];then message "Append the following line to your Bash Profile \n source ~/.shell_scripts/main.sh;";else message "Update Complete.";fi;cd -;fi;};install(){ git clone https://github.com/Sykander/Shell_Scripts.git ~/.shell_scripts;message "Append the following line to your Bash Profile \n source ~/.shell_scripts/main.sh;";};message(){ if [[ -z "$1" ]];then printf "\n ==================== \n\n\n";fi;if [[ -z "$2" ]];then printf "\n ==================== \n\n\n ${1}";fi;if [[ -z "$3" ]];then printf "\n ==================== \n\n\n ${1} ${2}:";fi;};setup
```

## Git

### Aliases
```
g       ~ git
ga      ~ git add
gaa     ~ git add -A
gc      ~ git commit
gp      ~ git pull
gstash  ~ git stash (Ensures untracked files are also stashed)
gr      ~ git reset
gch     ~ git checkout
gm      ~ git merge
gd      ~ git diff
gs      ~ git status
gl      ~ git log
```
### Functions
```
glb( distanceOne, distanceTwo )
# git diffs two commits based on their integer distance from the HEAD
# @param distance to commit being compared to
# @param distance to commit being compared from (default is the HEAD ie. 0)

gpatch( patchName )
# makes a patch file of all changes (including untracked files) since the current head located at $sh/patches/
# @param name for patch file, the current date time will be used if none is provided
```

## Rockar
```
nodeP
# installs node packages for the current project

finaR
# runs a finance regeneration for the current project

deleC
# deletes the cache for the current project

gulpC
# gulp compiles the current project

webdir
# Opens the directory of the given website
# @param website name

webconf
# opens the nginx web conf

website
# Opens a local version of a website
# @param the website store
# @param the website

jira
# Opens jira to the dashboard to a specified ticket
# @param ticket code

tempo
# Opens tempo to the current date

meet
# Opens Google Hangouts homepage

bitbucket
# Opens Bitbucket to the specified repository
# @param repo name (if none specified will direct to bitbucket dashboard)
# @param repo owner (defaults to rockar)

packages
# Opens packages.newbald1.com
# @param package to search for

checkDeployment
# Checks the deployment of a package version, by opening all relevent pages
# @param package name

watchSystemLog
# Watch the system log

testFile
# Creates a test php file (with Magento imported)

project
# Refresh or re init a project
# @param action to perform either (eg. 'refresh', 'init', 'hard-refresh')
```

## Sparta
```
intime
# Opens intime

bamboo
# Opens bamboo

office
# Opens office
```

# Contributing

If you'd like to contribute to the project by adding some new commands or by adjusting how the project is setup then feel free to make a feature branch and send a Pull Request.

# Resources

### [ASCII banner generator](http://patorjk.com/software/taag/#p=display&c=echo&f=Ogre&t=Packages%20%0AInstalled)

### [Shell Script minifier](http://bash-minifier.appspot.com)
