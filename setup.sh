sudo yum install epel-release -y
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo yum wget -y
sudo yum install redis -y
sudo systemctl start redis.service
sudo systemctl enable redis
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
yum install yum-utils -y
yum-config-manager --enable remi-php72
yum install php php-fpm php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo php-pear php-devel -y
pecl install igbinary igbinary-devel redis -y
sudo yum install nano -y
mkdir /etc/nginx/sites-available
mkdir /etc/nginx/sites-enabled
cd /usr/local/bin && wget https://raw.githubusercontent.com/Zakirzhan/myhost/master/myhost
chmod +x /usr/local/bin/myhost
sudo yum install git -y
sudo chmod -R 755 /var/www
service redis stop
cd /etc/ && rm -rf redis.conf && wget 'https://raw.githubusercontent.com/Zakirzhan/myhost/master/redis.conf'
service redis start
service php-fpm stop && service nginx stop
cd /etc/php-fpm.d/ && rm -rf www.conf && wget 'https://raw.githubusercontent.com/Zakirzhan/myhost/master/www.conf'
sudo systemctl start php-fpm
sudo systemctl restart nginx
echo "THAT's ALL! THANK YOU! :DD"