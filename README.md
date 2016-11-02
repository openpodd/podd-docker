# PODD Docker
Make development or deployment easier with docker. Now support only PODD backend
related services. For front-end development will coming soon.

### Prerequisites
git lfs, docker, docker-compose >= 1.8

### Preparation
Set environment variables:
  0. 3G RAM is recommended.
  1. Create named volumes by run `docker volume create --name podd_data`.
  2. `PODD_API_DIR` point to current working Django directory.
  3. `PODD_DJANGO_SECRET_KEY`
  4. `PODD_RAVEN_DSN`, optional, if you really want to connect with sentry. Go to docker-host:9000 first to get the DSN.
  5. Recommend [autoenv](https://github.com/kennethreitz/autoenv) to make your life easier with environment variables.

### Run
1. Specify `$PODD_API_DIR` to podd-api directory. Ex. `export PODD_API_DIR=/path/to/podd-api/podd`
2. `docker-compose up -d`
3. By default, the service port is not exposed. You can use `docker-compose.override.yml`, see config overriding for further instruction : https://docs.docker.com/compose/extends/.
4. If you want to run sentry.
  1. Go into `sentry/` folder.
  2. Run `docker-compose up -d`
  3. Run `docker-compose exec sentry sentry upgrade` and create your admin user.
  4. Go to http://docker_host:9200. Get the DSN.

### Things to do after services started.
You have 2 options. First, Load current data to postgresql.
  1. `psql -U postgres -W -h docker-host -p 5432 < podd-api-data.sql`
  2. `docker-compose exec api python manage.py rebuild_index -v3`
  3. `docker-compose exec api python manage.py rebuild_graph`

Or init the bare backend.
  1. `docker-compose run api python manage.py migrate`

### Note to self
Available services:
  - api
  - celery worker
  - celery beat
  - elasticsearch
  - neo4j
  - postgis
  - redis
  - cep

TO-DO:
  - Add podd-quiz.
  - Add podd-registration.
  - Add podd-rabies-connect.
