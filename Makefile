clean_temp:
	docker rm $(docker ps -a -q) || true

build:
	docker build -t phone_carriers:current -f docker/Dockerfile .

test: build-test run-test clean-test

build-test:
	docker build -t phone_carriers:test -f docker/test/Dockerfile .

run-test:
	docker run --rm --name  testing_phone_carriers  phone_carriers:test

clean-test:
	docker rmi -f phone_carriers:test || true

.PHONY: build-test \
	runt-test \
	clean-test \
	build \
	clean_temp