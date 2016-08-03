build:
	docker build --no-cache --rm -t julienbreux/docker-swarm-gui:latest .

run:
	docker run -it --rm -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock  julienbreux/docker-swarm-gui:latest

debug:
	docker run -it --rm --entrypoint=/bin/sh julienbreux/docker-swarm-gui:latest

localrun:
	RACK_ENV=production rackup

.PHONY: debug
