sudo yum install epel-release -y
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo yum wget -y
sudo yum install git -y
sudo yum install nano -y
cd /usr/local/bin && wget https://raw.githubusercontent.com/Zakirzhan/myhost/master/myhost
chmod +x /usr/local/bin/myhost
git config --global user.email "zako1996@mail.ru"
git config --global user.name "zakirzhan"
sudo chmod -R 755 /var/www
service nginx stop
cd /etc/nginx/ && rm -rf nginx.conf && wget https://raw.githubusercontent.com/Zakirzhan/myhost/master/nginx.conf
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
