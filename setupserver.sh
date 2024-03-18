export DEBIAN_FRONTEND=noninteractive
apt update
apt install git zip unzip curl software-properties-common nginx freerdp2-x11 xvfb -y
add-apt-repository ppa:ondrej/php 
apt install php8.2 php8.2-fpm php8.2-dev php8.2-mbstring php8.2-mysql php8.2-cli php8.2-mysqlnd php8.2-curl php8.2-gmp php8.2-cli php8.2-dev php8.2-imagick php8.2-soap php8.2-zip php8.2-xml php8.2-imap php8.2-xmlrpc php8.2-gd php8.2-opcache php8.2-intl php8.2-mysql php8.2-mbstring php8.2-xml php8.2-curl php8.2-intl php8.2-sqlite3 php8.2-bcmath -y
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer
apt install mariadb-server certbot python3-certbot-nginx supervisor -y
# edit php.ini
# nano /etc/php/8.2/fpm/php.ini
# systemctl restart php8.2-fpm

add-apt-repository ppa:openswoole/ppa -y
apt install -y php8.2-openswoole

ssh-keygen

git config --global user.name "Mick Tesla"
git config --global user.email "micktesla80@gmail.com"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# reload bashrc
npm install yarn -g

# install mega
wget https://mega.nz/linux/repo/Debian_12/amd64/megacmd-Debian_12_amd64.deb && sudo apt install "$PWD/megacmd-Debian_12_amd64.deb"

# pull repos
git clone git@github.com:lux10n/Atom-X.UI.git /var/www/ui
git clone git@github.com:lux10n/Atom-X.API.git /var/www/api
git clone git@github.com:lux10n/Atom-X.Checkers.git /var/www/checkers

# do configurations
# add mysql user
# create user 'dbname'@'localhost' identified by 'password';
# create database dbname;
# grant all on dbname.* to 'dbname'@'localhost';
# create database dbname_analytics;
# grant all on dbname_analytics.* to 'dbname'@'localhost';

# give access to www-data : storage, bootstrap/cache, database(ui only)
## laravel app :
# server {
#     listen 80;
#     listen [::]:80;
#     server_name example.com;
#     root /srv/example.com/public;
 
#     add_header X-Frame-Options "SAMEORIGIN";
#     add_header X-Content-Type-Options "nosniff";
 
#     index index.php;
 
#     charset utf-8;
 
#     location / {
#         try_files $uri $uri/ /index.php?$query_string;
#     }
 
#     location = /favicon.ico { access_log off; log_not_found off; }
#     location = /robots.txt  { access_log off; log_not_found off; }
 
#     error_page 404 /index.php;
 
#     location ~ \.php$ {
#         fastcgi_pass unix:/var/run/php/php8.2-fpm.sock;
#         fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
#         include fastcgi_params;
#     }
 
#     location ~ /\.(?!well-known).* {
#         deny all;
#     }
# }

## octane proxy :
# server {
#     listen  80;

#     server_name app.rehanmanzoor.me;
#     charset   utf-8;
#     client_max_body_size 1M;

#     location / {
#         proxy_pass    http://127.0.0.1:8001;
#         proxy_http_version 1.1;
#         proxy_set_header Upgrade $http_upgrade;
#         proxy_set_header Connection 'upgrade';
#         proxy_set_header Host $host;
#         proxy_cache_bypass $http_upgrade;
#     }
# }
## enable nginx site : ln -s /etc/nginx/sites-available/{name} /etc/nginx/sites-enabled/


## SUPERVISOR CONFIGURATIONS : /etc/supervisor/conf.d/{name}.conf

# [program:octane_app]
# process_name=%(program_name)s
# command=php /var/www/app/artisan octane:start --server=swoole --max-requests=1000
# autostart=true
# autorestart=true
# user=www-data
# redirect_stderr=true
# stdout_logfile=/var/www/app/storage/logs/octane_app.log
# stopwaitsecs=3600


# [program:api-worker]
# process_name=%(program_name)s_%(process_num)02d
# command=php /var/www/api/artisan queue:work --sleep=3 --tries=3 --max-time=3600
# autostart=true
# autorestart=true
# stopasgroup=true
# killasgroup=true
# numprocs=8
# user=www-data
# redirect_stderr=true
# stdout_logfile=/var/www/api/storage/logs/api-worker.log
# stopwaitsecs=3600

# [program:x-emulator]
# process_name=%(program_name)s
# command=Xvfb :99 -screen 0 1280x1024x24
# autostart=true
# autorestart=true
# user=root

# enable schedulers : https://laravel.com/docs/10.x/scheduling#running-the-scheduler
crontab -e
# * * * * * cd /path-to-your-project && php artisan schedule:run >> /dev/null 2>&1
# add root to www-data [RISKY - CHECKERS API ONLY] : https://superuser.com/a/1248008
############# CLOUDFLARE REAL IP -- NGINX ############

# /etc/nginx/modules

# Install Browscap
wget https://browscap.org/stream?q=BrowsCapINI -4 -O /etc/php/browscap.ini
## php.ini
