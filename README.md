# Source to Image

Create a Docker image of a Docker-ready application and push it to registry.

## GETTING STARTED

This container requires some variables to be provided. All of them *must* be defined:

* DOCKER_REGISTRY
* GIT_URL
* PROJECT_VERSION
* PROJECT_NAME

Example:

```
docker run \
 -e PROJECT_NAME=my-project \
 -e PROJECT_VERSION=staging \
 -e GIT_URL='git@github.com:your-github-login/my-project.git' \
 -e DOCKER_REGISTRY='192.168.122.1:5000' \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
 --rm source2image
```
## LICENSE

MIT License
