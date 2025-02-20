from ubuntu:latest
workdir /app/ict187.ch

run apt update -y
run apt upgrade -y
run apt install -y nginx php8.3 php8.3-fpm php8.3-xml php8.3-sqlite3  composer php8.3-mbstring php8.3-bcmath npm

copy ./app/ /app/ict187.ch

run composer install
run touch database/database.sqlite
run cp .env.example .env
run php artisan migrate
run php artisan key:gen
run npm install
run npm run build

copy ./nginx-server.conf /etc/nginx/sites-available/ict187.ch
run ln -s /etc/nginx/sites-available/ict187.ch /etc/nginx/sites-enabled/

copy ./entry.sh /app
run chmod +x /app/entry.sh 

run chown -R www-data:www-data .

entrypoint "/app/entry.sh"