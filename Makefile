.PHONY: noop
noop:
	echo

.PHONY: deps
deps:
	npm i
	npx lerna bootstrap

.PHONY: deps.container
deps.container:
	docker-compose run --rm --no-deps app npm i
	docker-compose run --rm --no-deps app npx lerna bootstrap


.PHONY: lint
lint:
	npm run lint

.PHONY: lint-fix
lint-fix:
	npm run lint:fix

.PHONY: lint-quiet
lint-quiet:
	npm run lint:quiet

.PHONY: serve
serve:
	docker-compose up --build

.PHONY: schema-update
schema-update:
	docker-compose run --rm --no-deps atcouncil ./bin/render-schema.sh > schema.json
