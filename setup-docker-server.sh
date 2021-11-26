sudo yum install epel-release -y
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo yum wget -y
sudo yum install git -y
sudo yum install nano -y
cd /usr/local/bin && wget https://raw.githubusercontent.com/Zakirzhan/myhost/master/newdocker
chmod +x /usr/local/bin/newdocker
git config --global user.email "zako1996@mail.ru"
git config --global user.name "zakirzhan"
sudo mkdir /var/www && chmod -R 755 /var/www
service nginx stop
mkdir '/etc/nginx/sites-enabled/' && mkdir '/etc/nginx/sites-available/'
cd /etc/nginx/ && rm -rf nginx.conf && wget https://raw.githubusercontent.com/Zakirzhan/myhost/master/nginx.conf
mkdir /etc/nginx/sites-available/ && 
sudo systemctl restart nginx
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce-20.10 docker-ce-cli-20.10 containerd.io -y
sudo systemctl start docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
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
