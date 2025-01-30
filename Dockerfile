from ubuntu:latest
workdir /app

run apt update -y
run apt upgrade -y
run apt install -y nginx php8.3 php8.3-fpm mysql-server 


copy ./nginx-server.conf /etc/nginx/sites-available/ict187.ch
run ln -s /etc/nginx/sites-available/ict187.ch /etc/nginx/sites-enabled/

copy ./entry.sh /app
run chmod +x /app/entry.sh 
run mkdir /app/ict187.ch

copy ./app/ /app/ict187.ch

expose 80:80

entrypoint "/app/entry.sh"