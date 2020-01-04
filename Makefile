docker-sync-start:
	docker-compose -f docker-compose.yml -f docker-compose-dev.yml -f docker-compose.override.yml up -d
	docker-sync start
docker-sync-stop:
	docker-compose stop
	docker-sync stop