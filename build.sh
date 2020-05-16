#!/bin/sh

[[ -z "${DOCKER_REGISTRY}" ]] && exit 1
[[ -z "${GIT_URL}" ]] && exit 1
[[ -z "${PROJECT_VERSION}" ]] && exit 1
[[ -z "${PROJECT_NAME}" ]] && exit 1

GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" \
  git clone -b ${PROJECT_VERSION} ${GIT_URL} /app || exit 1

cd /app

rm -rf .git

docker build -t ${PROJECT_NAME} .
docker tag ${PROJECT_NAME} ${DOCKER_REGISTRY}/${PROJECT_NAME}
docker push ${DOCKER_REGISTRY}/${PROJECT_NAME}
