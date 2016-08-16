FROM python:2.7

RUN apt-get update && apt-get install -y \
		gcc \
		gettext \
		mysql-client libmysqlclient-dev \
		postgresql-client libpq-dev \
		sqlite3 \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# COPY podd/settings/docker-template.py podd/settings/docker.py
ONBUILD RUN pip install -r requirements.txt

VOLUME /usr/src/app
EXPOSE 8000

ENV DJANGO_SETTINGS_MODULE podd.settings.docker
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
