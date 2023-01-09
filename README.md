# Running Multiple Containers to Service Full Stack Web Applications

This file explains how to define 'Docker Compose' file to run multiple container and link them all together.

I am creating 3 Container using the docker-compose.yml file in this project:
- MySQL to serve the database. I am linking this database to a local volume on host machine to avoide loss of data when the container stops running.
- PHP services to serve full stack applications like WordPress, Laravel and more.
- Nginx serve to spill out all the resource on the web browser. By default I am running nginx server on port 80 which is expose to the host machine.

I have created custom dockerfile to build images for PHP and Nginx container. Stable image for MySQL is being pulled from the docker hub.

php.dockerfile = Definition for php image
nginx.dockerfile = Definition for nginx image

Finally I have default.conf file which contains boilerplate configuration for nginx servers. I have changed the root directory to /var/www/html/public to serve this better for Laravel based application.
