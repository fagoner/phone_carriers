clean_temp:
	sudo docker rm $(sudo docker ps -a -q) || true

build:
	sudo docker build -t phone_carriers:latest -f docker/Dockerfile .

test: build-test run-test clean-test

build-test:
	sudo docker build -t phone_carriers:test -f docker/test/Dockerfile .

run-test:
	sudo docker run --rm --name  testing_phone_carriers  phone_carriers:test

clean-test:
	sudo docker rmi -f phone_carriers:test || true

.PHONY: build-test \
	runt-test \
	clean-test \
	build \
	clean_temp