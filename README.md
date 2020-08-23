# DUNP
Docker container template using docker-compose with Django, Nginx, uWSGI and Postgres


# Django Tutorial
Django Tutorial (Django Poll App) for Django version 3.1 with docker, docker-compose, uwsgi and nginx.

Requirements
------------
In order use this template , Docker and Docker-Compose are required (docker>19.03 CE and docker-compose>1.26).

Installation
------------

##### 1. Code / Repository

Repository can be cloned by one of following commands:
* Via SSH: `git clone git@github.com:krzysieqq/django_tutorial.git`
* Via HTTPS: `git clone https://github.com/krzysieqq/django_tutorial.git`

##### 2. Docker containers

Upon cloning the repository `django-tutorial` project can be built and ran using commands:

1. `./run.sh -i` to install local development components and build docker image
2. `./run.sh -u` to start local containers with follow output or `./run.sh -u` without output
3. Optional. If you'd like to create super user account run `./run.sh -csu <password>` f.g. `./run.sh -csu admin`. Default admin username is `admin`.

Script will pull and build all required docker images of `django-tutorial`, as well as run all required commands from 
`entrypoint.local.sh` and install packages from `requirements.local.txt` used only for local development.

Local web address: `http://localhost:8000/` \
Django Admin Panel address: `http://localhost:8000/admin` \
WDB address: `http://localhost:1984`
    
Tests
-----

Tests are executed with command in `backend` container `pytest`. if test coverage is less then 96% tests will fail.

If you'd like to run tests outside container:
`CI_REGISTRY=localhost RELEASE_VERSION=local ./check_tests.sh`

Instructions
-----

##### Usage of `./run.sh` file:

```
Usage (params with '*' are optional):
./run.sh                                             -> UP containers in detach mode
./run.sh bash|-sh                                    -> Open bash in main container
./run.sh build|-b <params*>                          -> BUILD containers
./run.sh build-force|-bf <params*>                   -> Force build containers (with params no-cache, pull)
./run.sh custom_command|-cc                          -> Custom docker-compose command
./run.sh create_django_secret|-crs                   -> Create Django Secret Key
./run.sh create_superuser|-csu <password>            -> Create default super user
./run.sh down|-dn                                    -> DOWN (stop and remove) containers
./run.sh downv|-dnv                                  -> DOWN (stop and remove with volumes) containers
./run.sh init|-i <project name> <django version*>    -> Initial setup and config all environment and django project
./run.sh help|-h                                     -> Show this help message
./run.sh logs|-l <params*>                           -> LOGS from ALL containers
./run.sh logsf|-lf <params*>                         -> LOGS from ALL containers with follow option
./run.sh shell|-sl                                   -> Open shell in main container
./run.sh shell_plus|-sp                              -> Open shell plus (only if django_extensions installed) in main container
./run.sh makemigrate|-mm <params*>                   -> Make migrations and migrate inside main container
./run.sh notebook|-nb                                -> Run notebook (only if django_extensions installed)
./run.sh recreate|-rec <params*>                     -> Up and recreate containers
./run.sh recreated|-recd <params*>                   -> Up and recreate containers in detach mode
./run.sh restart|-r <params*>                        -> Restart containers
./run.sh rm|-rm <params*>                            -> Remove force container
./run.sh setup|-stp                                  -> Setup project for local development
./run.sh stop|-s <params*>                           -> Stop containers
./run.sh test|-t <params*>                           -> Run tests
./run.sh up|-u <params*>                             -> UP containers with output
```

You could also run `./run.sh help` or `./run.sh -h` in terminal to show this message.
