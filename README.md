## Django Development With Docker Compose and Machine

Featuring:

- Docker 
- Docker Compose
- Docker Machine
- Python 2.7

### OS X Instructions


login: `bash --login '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'`

#### DEV

1. Start new machine - `docker-machine create -d virtualbox local`
1. Set environment - `eval "$(docker-machine env local)"`
1. Run swarm - `docker run swarm create`, copy the token and put it somewhere
1. Create a swarm-master - `docker-machine create -d virtualbox --swarm --swarm-master --swarm-discovery token://SWARM_CLUSTER_TOKEN swarm-node1`
1. Create swarm-node - `docker-machine create -d virtualbox --swarm --swarm-discovery token://SWARM_CLUSTER_TOKEN swarm-master`
1. Build images - `docker-compose build`
1. Start services - `docker-compose up -d`
1. Create migrations - `docker-compose run api /usr/local/bin/python manage.py migrate`
1. Grab IP - `docker-machine ip local` - and view in your browser

#### PRODUCTION

1. Stop the processes - `docker-compose stop`
1. Start new machine - `docker-machine create --driver digitalocean --digitalocean-access-token=c71abc610119409a3c2d59c28ba9013aad797d4ab1d2400dff1e707979defec1 --digitalocean-region sgp1 --digitalocean-size 512mb qodlab`
1. Set environment - `eval "$(docker-machine env production)"`
1. Build images - `docker-compose build`
1. Start services - `docker-compose -f production.yml up -d`
1. Create migrations - `docker-compose run api /usr/local/bin/python manage.py migrate`


### ref

1. `https://realpython.com/blog/python/django-development-with-docker-compose-and-machine/`
1. `https://github.com/realpython/dockerizing-django/blob/master/README.md`
1. swarm token: 97c7e1ff7092b2834e8f3d2d6188b9d9

docker-machine create -d virtualbox --swarm --swarm-discovery token://97c7e1ff7092b2834e8f3d2d6188b9d9 swarm-master