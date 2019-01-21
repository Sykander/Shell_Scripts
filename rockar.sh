# Rockar Aliases

alias php56='/usr/local/Cellar/php@5.6/5.6.36_1/bin/php';
alias php71='/usr/local/Cellar/php@7.1/7.1.19/bin/php';
alias composer71='php71 /usr/local/bin/composer';
alias composer56='php56 /usr/local/bin/composer';
alias nodeP='cd web/skin/frontend/rockar; npm i &&
echo "__________                __                                   .___                 __         .__  .__             .___";
echo "\______   \_____    ____ |  | _______     ____   ____   ______ |   | ____   _______/  |______  |  | |  |   ____   __| _/";
echo " |     ___/\__  \ _/ ___\|  |/ /\__  \   / ___\_/ __ \ /  ___/ |   |/    \ /  ___/\   __\__  \ |  | |  | _/ __ \ / __ | ";
echo " |    |     / __ \\  \___|    <  / __ \_/ /_/  >  ___/ \___ \  |   |   |  \\___ \  |  |  / __ \|  |_|  |_\  ___// /_/ | ";
echo " |____|    (____  /\___  >__|_ \(____  /\___  / \___  >____  > |___|___|  /____  > |__| (____  /____/____/\___  >____ | ";
echo "                \/     \/     \/     \//_____/      \/     \/           \/     \/            \/               \/     \/ ";
cd -;';
alias gulpC='cd web/skin/frontend/rockar; gulp compile --dev --hard-lint &&
echo "_________                       .__.__             .___";
echo "\_   ___ \  ____   _____ ______ |__|  |   ____   __| _/";
echo "/    \  \/ /  _ \ /     \\____  \|  |  | _/ __ \ / __ | ";
echo "\     \___(  <_> )  Y Y  \  |_> >  |  |_\  ___// /_/ | ";
echo " \______  /\____/|__|_|  /   __/|__|____/\___  >____ | ";
echo "        \/             \/|__|                \/     \/ ";
cd -;';
alias finaR='cd web/shell/rockar; php71 financing_calculation.php -- regenerate &&
echo "___________.__                                    __________                                                 __             .___";
echo "\_   _____/|__| ____ _____    ____   ____  ____   \______   \ ____   ____   ____   ____   ________________ _/  |_  ____   __| _/";
echo " |    __)  |  |/    \ \__  \  /    \_/ ___\/ __ \   |       _// __ \ / ___\_/ __ \ /    \_/ __ \_  __ \__  \\   __\/ __ \ / __ | ";
echo " |     \   |  |   |  \/ __ \|   |  \  \__\  ___/   |    |   \  ___// /_/  >  ___/|   |  \  ___/|  | \// __ \|  | \  ___// /_/ | ";
echo " \___  /   |__|___|  (____  /___|  /\___  >___  >  |____|_  /\___  >___  / \___  >___|  /\___  >__|  (____  /__|  \___  >____ | ";
echo "     \/            \/     \/     \/     \/    \/          \/     \/_____/      \/     \/     \/           \/          \/     \/ ";
cd -;';
alias deleC='rm -rf web/var/cache && mkdir web/var/cache && echo "\n" &&
echo "_________               .__             ________         .__          __             .___" &&
echo "\_   ___ \_____    ____ |  |__   ____   \______ \   ____ |  |   _____/  |_  ____   __| _/" &&
echo "/    \  \/\__  \ _/ ___\|  |  \_/ __ \   |    |  \_/ __ \|  | _/ __ \   ___/ __ \ / __ | " &&
echo "\     \____/ __ \\   \___|   Y  \  ___/   |    \`   \  ___/|  |_\  ___/|  | \  ___// /_/ | " &&
echo " \______  (____  /\___  |___|  /\___  > /_______  /\___  |____/\___  |__|  \___  \____ | " &&
echo "        \/     \/     \/     \/     \/          \/     \/          \/          \/     \/ ";';
alias projectInit="composer71 update --prefer-source; nodeP; gulpC; finaR;"
alias projectRefresh='composer71 update --prefer-source;
  composer71 run-script post-install-cmd -vvv -- --redeploy;
  gulpC;';

# Rockar Functions
webdir() {
    local site;

    if [ -z "$1" ]; then
        site='';
    else
        if [ "$1" = 'rockar' ] || [ "$1" = 'r' ]; then
            site='rockar';
        elif [ "$1" = 'harwoods' ] || [ "$1" = 'h' ]; then
            site='rockar-harwoods';
        elif [ "$1" = 'ford' ] || [ "$1" = 'f' ]; then
            site='rockar-ford';
        elif [ "$1" = 'vue-workspace' ] || [ "$1" = 'v' ]; then
            site='vue-workspace';
        else
            site='rockar';
        fi
    fi
    cd /usr/local/var/www/${site};
}

webconf() {
    cd /usr/local/etc/nginx;
}

website() {
    local store;
    local site;

    if [ -z "$1" ]; then
        store='jaguar';
        site='rockar';
    else
        if [ "$1" = 'jaguar' ] || [ "$1" = 'j' ]; then
            store='jaguar';
        elif [ "$1" = 'landrover' ] || [ "$1" = 'l' ]; then
            store='landrover';
        else
            store='jaguar';
        fi

        if [ "$2" = 'rockar' ] || [ "$2" = 'r' ]; then
            site='rockar';
        elif [ "$2" = 'harwoods' ] || [ "$2" = 'h' ]; then
            site='harwoods';
        fi
    fi

    if [ "$site" = 'rockar' ] || [ "$site" = 'harwoods' ]; then
        open https://${store}.${site}.local/;
    fi
}

jira() {
  if [ -z "$1" ]; then
    open "https://rockar.atlassian.net/secure/Dashboard.jspa#";
  else
    open "https://rockar.atlassian.net/browse/$1";
  fi
}

tempo() {
    open 'https://rockar.atlassian.net/plugins/servlet/ac/is.origo.jira.tempo-plugin/tempo-my-work';
}

meet() {
    open 'https://meet.google.com/';
}

bitbucket() {
  if [ -z "$2" ]; then
    2='rockar';
  fi

  if [ -z "$1" ]; then
    open "https://bitbucket.org/dashboard/overview";
  else
    open https://bitbucket.org/${2}/${1}/commits/all;
  fi
}

packages() {
  if [ -z "$1" ]; then
    open "http://packages.newbald1.com/";
  else
    open http://packages.newbald1.com/\#!/${1};
  fi
}

checkDeployment() {
    bitbucket $1 && packages $1;
}

clearSystemLog() {
    rm web/var/log/system.log;
    touch web/var/log/system.log;
}

watchSystemLog() {
    tail -f web/var/log/system.log;
}

clearWatchSystemLog() {
    clearSystemLog;
    watchSystemLog;
}

makeMageTestFile() {
    local file='web/test.php';
    if [ -f $file ] ; then
        rm $file;
    fi
    touch web/test.php;
    echo '<?php require_once "app/Mage.php"; Mage::app(); echo "<h4>Test File</h4>";' >> web/test.php;
    atom web/test.php;
}

# Set default versions for php and composer
alias php='php71';
alias composer='composer71';
