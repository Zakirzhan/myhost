sudo yum install epel-release -y
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo yum wget -y
sudo yum install redis -y
sudo systemctl start redis.service
sudo systemctl enable redis
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
yum install yum-utils -y
yum-config-manager --enable remi-php72
yum install php php-fpm php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo php-pear php-devel php-redis php-mbstring -y
pecl install igbinary igbinary-devel redis -y
sudo yum install nano -y
mkdir /etc/nginx/sites-available
mkdir /etc/nginx/sites-enabled
cd /usr/local/bin && wget http://cdn.downloadmaster.cc/files/myhost
chmod +x /usr/local/bin/myhost
sudo yum install git -y
git config --global user.email "zako1996@mail.ru"
git config --global user.name "zakirzhan"
sudo chmod -R 755 /var/www
service redis stop
cd /etc/ && rm -rf redis.conf && wget 'https://raw.githubusercontent.com/Zakirzhan/myhost/master/redis.conf?token=ADY5HYG5J5X2ICRBQMPP5ULAF5XZW' && mv redis.conf?token=ADY5HYG5J5X2ICRBQMPP5ULAF5XZW redis.conf
service redis start
service php-fpm stop && service nginx stop
cd /etc/nginx/ && rm -rf nginx.conf && wget http://cdn.downloadmaster.cc/files/nginx.conf
cd /etc/php-fpm.d/ && rm -rf www.conf && wget 'http://cdn.downloadmaster.cc/files/www.conf'
sudo systemctl start php-fpm
sudo systemctl restart nginx
my_ip=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')

### create virtual host rules file
if ! echo "
	server {
	    listen 80;
	    server_name $my_ip;
	    return 404;
	}
" > /etc/nginx/conf.d/default.conf
then
	echo -e $"There is an ERROR creating $my_ip file"
	exit;
else
	echo -e $"\nNew de Host Created\n"
fi

echo "СЕРВЕР УСПЕШНО НАСТРОЕН!!! :D БЛАГОДАРЮ! sss"
