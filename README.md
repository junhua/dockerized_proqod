## Django Development With Docker Compose and Machine

Featuring:

- Docker 
- Docker Compose
- Docker Machine
- Python 2.7

### OS X Instructions


login: `bash --login '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'`

#### DEV

1. Start new machine - `docker-machine create -d virtualbox dev;`
1. Set environment - `eval "$(docker-machine env dev)"`
1. Build images - `docker-compose build`
1. Start services - `docker-compose up -d`
1. Create migrations - `docker-compose run web /usr/local/bin/python manage.py migrate`
1. Grab IP - `docker-machine ip dev` - and view in your browser

#### PRODUCTION

1. Stop the processes - `docker-compose stop`
1. Start new machine - `docker-machine create --driver digitalocean --digitalocean-access-token=d6ea857634bc120884e527304a2719f0301673724b7645e91876cb661cd4dd96 --digitalocean-region sgp1 --digitalocean-size 512mb production`
1. Set environment - `eval "$(docker-machine env production)"`
1. Build images - `docker-compose build`
1. Start services - `docker-compose -f production.yml up -d`
1. Create migrations - `docker-compose run web /usr/local/bin/python manage.py migrate`


### ref

1. `https://realpython.com/blog/python/django-development-with-docker-compose-and-machine/`
1. `https://github.com/realpython/dockerizing-django/blob/master/README.md`