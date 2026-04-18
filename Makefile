restart:
	docker compose down
	docker compose up -d


devel-symlink:
	ln -s docker-compose-devel.yaml docker-compose.yaml


devel-uv-init:
	docker compose run --rm api uv init
	docker compose run --rm api uv add 'fastapi[standard]==0.135.3' --dev
	docker compose run --rm api uv add 'wdb' --dev


devel-cleanup:
	docker compose run --rm api rm -rf /api/.git


devel-setup:
	make devel-symlink
	make restart


devel-new-setup:
	make devel-symlink
	make devel-uv-init
	make devel-cleanup
	make restart
