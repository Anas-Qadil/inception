#Docker Compose Infrastructure with NGINX, WordPress, and MariaDB

# Project Requirements

This project consists in setting up a small infrastructure composed of different services under specific rules. The entire project has to be done in a virtual machine and must use Docker Compose.

## Docker Compose

- Use Docker Compose to set up the infrastructure
- Each Docker image must have the same name as its corresponding service
- Each service has to run in a dedicated container
- The containers must be built either from the penultimate stable version of Alpine or Debian
- Write your own Dockerfiles, one per service

## Services

The following services must be set up:

- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only
- A Docker container that contains WordPress + php-fpm only without nginx
- A Docker container that contains MariaDB only without nginx
- A volume that contains your WordPress database
- A second volume that contains your WordPress website files
- A docker-network that establishes the connection between your containers

## Other Requirements

- Your containers have to restart in case of a crash
- Do not use any hacky patch based on 'tail -f' and so forth when trying to run your containers
- Do not use network: host or --link or links:
- The network line must be present in your docker-compose.yml file
- Your containers must not be started with a command running an infinite loop
- In your WordPress database, there must be two users, one of them being the administrator
- The administrator's username can't contain admin/Admin or administrator/Administrator
- Your volumes will be available in the /home/login/data folder of the host machine using Docker
- No password must be present in your Dockerfiles
- It is mandatory to use environment variables
- It is strongly recommended to use a .env file to store environment variables. The .env file should be located at the root of the srcs directory
- Your NGINX container must be the only entrypoint into your infrastructure via the port 443 only, using the TLSv1.2 or TLSv1.3 protocol

## Domain Name

To make things simpler, you have to configure your domain name so it points to your local IP address. This domain name must be login.42.fr. Again, you have to use your own login. For example, if your login is wil, wil.42.fr will redirect to the IP address pointing to wil's website.

## Other Notes

- The latest tag is prohibited

