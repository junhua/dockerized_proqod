docker-compose stop
eval "$(docker-machine env qodlab)"
docker-compose build
docker-compose -f production.yml up -d
docker-compose run api /usr/local/bin/python manage.py migrate
docker-machine ip qodlab