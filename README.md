# Moosh in docker
Moosh is a very convenient CLI for Moodle LMS and we provide a way to dockerize it
## Build Moosh docker image
```bash
docker build . -t ulysseus/moosh:0.1
```
## Update env file
Change moodle run dir, moodle data dir, database password file and config.php file
```bash
cp .env.template .env
nano .env
```
## Launch Moosh container
```bash
docker-compose run moosh
```
