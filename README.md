# PODD Docker
Make development or deployment easier with docker. Now support only PODD backend
related services. For front-end development will coming soon.

### !!NOTE!!
Available services:
  - api
  - celery worker
  - celery beat
  - elasticsearch
  - neo4j
  - postgis
  - redis
  - cep

To-do:
  - Add podd-quiz.
  - Add podd-registration.
  - Add podd-rabies-connect.

### Pre-requisite
git lfs(large-file-system), docker, docker compose

### Preparation
Set environment variables:
  0. VM memory 3G is recommended.
  1. Create named volumes by run `docker volume create --name podd_data`.
  2. `PODD_API_DIR` point to current working Django directory.
  3. `PODD_DJANGO_SECRET_KEY`
  4. `PODD_RAVEN_DSN`, optional, if you really want to connect with sentry. Go to docker-host:9000 first to get the DSN.

### Run
1. Run `docker-compose run sentry upgrade` on first start.
2. Specify `$PODD_API_DIR` to podd-api directory. Ex. `export PODD_API_DIR=/path/to/podd-api/podd`
3. `docker-compose up -d`
4. By default, the service port is not exposed. To expose it use `docker-compose -f docker-compose.exposed.yml up -d`
5. To run with sentry, run as another service separately.
  1. Go into sentry/ folder.
  2. Run `docker-compose -f docker-compose.sentry.yml up -d`
  3. Run `docker-compose -f docker-compose.sentry.yml exec sentry sentry upgrade` and create your admin user.
  4. Go to docker_host:9200. Get the DSN.

### Things to do after services started.
Load current data to postgresql.
  1. `psql -U postgres -W -h docker-host -p 5432 < podd-api-data.sql`
  2. `docker-compose exec podd_api python manage.py rebuild_index -v3`
  3. `docker-compose exec podd_api python manage.py rebuild_graph`

Or init the bare backend.
  1. `docker-compose run podd_api python manage.py migrate`
