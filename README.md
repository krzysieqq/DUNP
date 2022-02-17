# DUNP
Docker container template using docker-compose with Django, Nginx, uWSGI and Postgres

Requirements
------------
In order use this template `bash`, `Docker` and `Docker-Compose` are required (docker>19.03 CE and docker-compose>1.26). \
Tested only on Ubuntu-based Linux distribution but should work on MacOS

Initialization new custom project
------------

##### 1. Clone repo

Repository can be cloned by one of following commands:
* Via SSH: `git clone git@github.com:krzysieqq/DUNP.git <your_project_name>`
* Via HTTPS: `git clone https://github.com/krzysieqq/DUNP.git <your_project_name>`

##### 2. Docker containers

Upon cloning the repository to init your project you should run commands below:

1. `./run.sh -i <your_project_name>` to initialize local setup and config development environment with creating new django project. Remember that `<your_project_name>` should follow [PEP-8 - Package and Module Names](https://www.python.org/dev/peps/pep-0008/#package-and-module-names) convention.
    - Optionally you could give your Django version to init project by running command `./run.sh -i <your_project_name> <django_version>` f.g. `./run.sh -i foo_bar 4.0`
2. `./run.sh -u` to start local containers with follow output or `./run.sh -u` without output.
3. Optional. If you'd like to create super user account run `./run.sh -csu <password>` f.g. `./run.sh -csu admin`. Default admin username is `admin`.
4. You can delete original `.git` folder (`rm -rf .git`) and init your repository to start develop project.

Local web address: `http://localhost:8000/` \
Django Admin Panel address: `http://localhost:8000/admin` \
WDB address: `http://localhost:1984`

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
./run.sh init|-i <project name> <django version*>    -> Initial setup and config development environment with creating new django project
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
