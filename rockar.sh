nodeP() {
    cd web/skin/frontend/rockar; npm i &&
    echo "   ___           _                          " &&
    echo "  / _ \__ _  ___| | ____ _  __ _  ___  ___  " &&
    echo " / /_)/ _\` |/ __| |/ / _\` |/ _\` |/ _ \/ __| " &&
    echo "/ ___/ (_| | (__|   < (_| | (_| |  __/\__ \ " &&
    echo "\/    \__,_|\___|_|\_\__,_|\__, |\___||___/ " &&
    echo "                           |___/            " &&
    echo "  _____           _        _ _          _   " &&
    echo "  \_   \_ __  ___| |_ __ _| | | ___  __| |  " &&
    echo "   / /\/ '_ \/ __| __/ _\` | | |/ _ \/ _\` |  " &&
    echo "/\/ /_ | | | \__ \ || (_| | | |  __/ (_| |  " &&
    echo "\____/ |_| |_|___/\__\__,_|_|_|\___|\__,_|  " &&
    echo "                                            ";
    cd -;
}

finaR() {
    cd web/shell/rockar; php financing_calculation.php -- regenerate &&
    echo "   ___ _                                                 " &&
    echo "  / __(_)_ __   __ _ _ __   ___ ___                      " &&
    echo " / _\ | | '_ \ / _\` | '_ \ / __/ _ \                     " &&
    echo "/ /   | | | | | (_| | | | | (_|  __/                     " &&
    echo "\/    |_|_| |_|\__,_|_| |_|\___\___|                     " &&
    echo "                                                         " &&
    echo "   __                                      _           _ " &&
    echo "  /__\ ___  __ _  ___ _ __   ___ _ __ __ _| |_ ___  __| |" &&
    echo " / \/// _ \/ _\` |/ _ \ '_ \ / _ \ '__/ _\` | __/ _ \/ _\` |" &&
    echo "/ _  \  __/ (_| |  __/ | | |  __/ | | (_| | ||  __/ (_| |" &&
    echo "\/ \_/\___|\__, |\___|_| |_|\___|_|  \__,_|\__\___|\__,_|" &&
    echo "           |___/                                         ";
    cd -;
}

deleC() {
    rm -rf web/var/cache && mkdir web/var/cache &&
    echo "   ___           _              ___ _                         _ " &&
    echo "  / __\__ _  ___| |__   ___    / __\ | ___  __ _ _ __ ___  __| |" &&
    echo " / /  / _\` |/ __| '_ \ / _ \  / /  | |/ _ \/ _\` | '__/ _ \/ _\` |" &&
    echo "/ /__| (_| | (__| | | |  __/ / /___| |  __/ (_| | | |  __/ (_| |" &&
    echo "\____/\__,_|\___|_| |_|\___| \____/|_|\___|\__,_|_|  \___|\__,_|" &&
    echo "                                                                ";
}

gulpC() {
    cd web/skin/frontend/rockar; gulp compile --dev --hard-lint &&
    echo "   ___                      _ _          _ " &&
    echo "  / __\___  _ __ ___  _ __ (_) | ___  __| |" &&
    echo " / /  / _ \| '_ \` _ \| '_ \| | |/ _ \/ _\` |" &&
    echo "/ /__| (_) | | | | | | |_) | | |  __/ (_| |" &&
    echo "\____/\___/|_| |_| |_| .__/|_|_|\___|\__,_|" &&
    echo "                     |_|                   " &&
    echo "                                           ";
    cd -;
}

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
    cd ${GLOBAL_NGINX_HTML}/${site};
}

webconf() {
    cd "${GLOBAL_NGINX_CONF}";
}

# Opens a local version of a website
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

# Opens jira to the dashboard to a specified ticket
# @param ticket code
jira() {
  if [ -z "$1" ]; then
    open "https://rockar.atlassian.net/secure/Dashboard.jspa#";
  else
    open "https://rockar.atlassian.net/browse/$1";
  fi
}

# Opens tempo to the current date
tempo() {
    open 'https://rockar.atlassian.net/plugins/servlet/ac/is.origo.jira.tempo-plugin/tempo-my-work';
}

# Opens Google Hangouts homepage
meet() {
    open 'https://meet.google.com/';
}

# Opens Bitbucket to the specified repository
# @param repo name (if none specified will direct to bitbucket dashboard)
# @param repo owner (defaults to rockar)
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

# Opens packages.newbald1.com
# @param package to search for
packages() {
  if [ -z "$1" ]; then
    open "http://packages.newbald1.com/";
  else
    open http://packages.newbald1.com/\#!/${1};
  fi
}

# Checks the deployment of a package version, by opening all relevent pages
# @param package name
checkDeployment() {
    bitbucket $1;
    packages $1;
}

# Watch the system log
watchSystemLog() {
    tail -f web/var/log/system.log;
}

# Creates a test php file (with Magento imported)
testFile() {
    local file='web/test.php';
    if [ -f $file ] ; then
        rm $file;
    fi
    touch web/test.php;
    echo '<?php require_once "app/Mage.php"; Mage::app(); echo "<h4>Test File</h4>";' >> web/test.php;
    echo 'function printPre($thing) {echo "<pre>"; print_r($thing); echo "</pre>";}' >> web/test.php;
}

project() {
    if [ -z "$1" ]; then
        1="refresh"
    fi

    if [ $1 = 'refresh'] || [ $1 = 'r']; then
        composer update --prefer-source;
        composer run-script post-install-cmd -vvv -- --redeploy;
        gulpC;
    fi

    if [ $1 = 'init'] || [ $1 = 'i']; then
        composer update --prefer-source;
        composer run-script post-install-cmd -vvv -- --redeploy;
        nodeP;
        gulpC;
        finaR;
    fi
}
