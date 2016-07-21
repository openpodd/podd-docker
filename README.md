# PODD Docker
Make development or deployment easier with docker. Now support only PODD backend
related services. For front-end development will coming soon.

### !!NOTE!!
To-do:
  - Add podd-quiz.
  - Add podd-registration.
  - Add podd-rabies-connect.

### Pre-requisite
git lfs(large-file-system), docker, docker compose

### Preparation
Set environment variables:
  1. `PODD_API_DIR` point to current working Django directory.
  2. `PODD_DJANGO_SECRET_KEY`
  3. `PODD_RAVEN_DSN`, optional, if you really want to connect with sentry. Go to docker-host:39000 first to get the DSN.

Load current data to postgresql.
  1. `psql -U postgres -W -h docker-host -p 35432 < podd-api-data.sql`

Or init the bare backend.
  1. `docker-compose run podd_api python manage.py migrate`

### Run
1. Run `docker-compose run sentry upgrade` on first start.
2. Specify `$PODD_API_DIR` to podd-api directory. Ex. `export PODD_API_DIR=/path/to/podd-api/podd`
3. `docker-compose up -d`
