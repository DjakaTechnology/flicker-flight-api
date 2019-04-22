# flicker-flight-api
An API For Flicker Flight

How to install : 
1. Put this folder project to your public www folder (e.g xampp/htdocs)
2. Rename .env.example to .env
3. Open .env and edit it to match your database configuration
4. Open cmd/terminal
5. Go to you folder (e.g xampp/htdocs/flicker-api)
6. Get passport by typing this command : 
composer require laravel/passport
5. Install passport by typing this command :
php artisan passport:install
6. Generate app key by typing this command : 
php artisan key:generate
7. Run this by using this command : 
php artisan serve --host your.ip.address --port your port (e.g php aritsan serve --host 192.168.1.4 --port 80)
or
php artisan serve (to run in your 127.0.0.1:8000)
9. Open in the browser by typing your ipaddress
10. Finish

WARNING : This Source code is not production ready beacuse I haven't implement any securities
