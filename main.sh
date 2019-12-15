export sh="$( cd "$( dirname "$0" )" && pwd )"
$sh/setup.sh;

# configuration
GLOBAL_NGINX_HTML='/usr/local/var/www'; # directory where nginx websites are located
GLOBAL_NGINX_CONF='/usr/local/etc/nginx';
GLOBAL_MICROSERVICES='/Users/sykander/MicroServices';

# source scripts
source $sh/.rockar.sh
source $sh/.sparta.sh
source $sh/.git.sh
