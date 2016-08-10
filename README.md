# Docker Swarm GUI

[![Docker pull](https://img.shields.io/docker/pulls/julienbreux/docker-swarm-gui.svg)](https://hub.docker.com/r/julienbreux/docker-swarm-gui/) [![Docker pull](https://img.shields.io/docker/stars/julienbreux/docker-swarm-gui.svg)](https://hub.docker.com/r/julienbreux/docker-swarm-gui/) [![Github issues](https://img.shields.io/github/issues/JulienBreux/docker-swarm-gui.svg)](https://github.com/JulienBreux/docker-swarm-gui/issues) [![License](https://img.shields.io/github/license/JulienBreux/docker-swarm-gui.svg)](https://github.com/JulienBreux/docker-swarm-gui/blob/master/LICENSE)
[![Dependency Status](https://dependencyci.com/github/JulienBreux/docker-swarm-gui/badge)](https://dependencyci.com/github/JulienBreux/docker-swarm-gui)
[![Twitter](https://img.shields.io/twitter/follow/JulienBreux.svg)](https://twitter.com/JulienBreux)

:package: [Docker](https://www.docker.com) Swarm GUI is a tiny tool to help you to visualize the state of your [Docker](https://www.docker.com) swarm.

## Get started

```sh
docker run -it --rm -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock  julienbreux/docker-swarm-gui:latest
```

### Preview

![Docker Swarm GUI preview](https://raw.githubusercontent.com/JulienBreux/docker-swarm-gui/master/resources/screenshots/interface.gif)

## Donate

I maintain this project in my free time, if it helped you please support my work [via paypal](https://paypal.me/JulienBreux), thanks a lot!

## License

See [LICENSE](https://github.com/JulienBreux/docker-swarm-gui/blob/master/LICENSE).

## GPG Signature

You can download Julien Breux's public key to verify the signature.

    gpg --keyserver hkp://pgp.mit.edu --recv-keys 0998EBAA


## Alternative

- [Docker Swarm Visualizer](https://github.com/ManoMarks/docker-swarm-visualizer)
