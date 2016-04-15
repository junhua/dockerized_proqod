## Django Development With Docker Compose and Machine

Featuring:

- Docker 
- Docker Compose
- Docker Machine
- Python 2.7
- Virtualbox

### OS X Instructions

Do the following when you first create the Docker orchastration 

#### DEV

1. Start new machine named `local` in virtualbox - `docker-machine create -d virtualbox local`
1. Set environment to be `local` - `eval "$(docker-machine env local)"`
1. Run swarm - `docker run swarm create`, copy the token and keep it safely

1. (Optional) Create a swarm-master - `docker-machine create -d virtualbox --swarm --swarm-master --swarm-discovery token://SWARM_CLUSTER_TOKEN swarm-node1`
1. (Optional) Create swarm-node - `docker-machine create -d virtualbox --swarm --swarm-discovery token://SWARM_CLUSTER_TOKEN swarm-master`
1. Build images - `docker-compose build`
1. Start services - `docker-compose up -d`
1. Run api container - `docker-compose run api /usr/local/bin/python manage.py migrate`
1. Run front container - `docker-compos run front`
1. Grab IP - `docker-machine ip local` - and view in your browser

#### PRODUCTION

1. Start new machine at digital ocean named `qodlab` - `docker-machine create --driver digitalocean --digitalocean-access-token=c71abc610119409a3c2d59c28ba9013aad797d4ab1d2400dff1e707979defec1 --digitalocean-region sgp1 --digitalocean-size 1gb qodlab`
1. Set environment to `qodlab` - `eval "$(docker-machine env production)"`
1. Build images - `docker-compose build`
1. Start up services - `docker-compose -f production.yml up -d`
1. Run API container - `docker-compose run api /usr/local/bin/python manage.py migrate`
1. Run front container -`docker-compose run front -d`


#### Other useful commands
1. To update a service: `docker-compose run <service name> -d`

### ref

1. `https://realpython.com/blog/python/django-development-with-docker-compose-and-machine/`
1. `https://github.com/realpython/dockerizing-django/blob/master/README.md`
1. swarm token: 97c7e1ff7092b2834e8f3d2d6188b9d9

