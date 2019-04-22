# flicker-flight-api
An API For Flicker Flight

How to install : 
1. Put this folder project to your public www folder (e.g xampp/htdocs)
2. Rename .env.example to .env
3. Open .env and edit it to match your database configuration
4. Open cmd/terminal
5. Go to you folder (e.g xampp/htdocs/flicker-api)
6. Get passport by typing this command : <br>
composer require laravel/passport <br>
5. Install passport by typing this command : <br>
php artisan passport:install <br>
6. Generate app key by typing this command : <br>
php artisan key:generate <br>
7. Run this by using this command : <br>
php artisan serve --host your.ip.address --port your port (e.g php aritsan serve --host 192.168.1.4 --port 80)<br>
or<br>
php artisan serve (to run in your 127.0.0.1:8000)<br>
9. Open in the browser by typing your ipaddress<br>
10. Finish<br>

WARNING : This Source code is not production ready beacuse I haven't implement any securities
