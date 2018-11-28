#!/bin/bash

. `dirname $0`/env.sh

docker network create ${DOCKER_NETWORK}

# Verifies if a container with the same name is already running.
CONTAINERS=$(docker ps -a | grep ${DOCKER_RUN_NAME})

if [ ! -z ${CONTAINERS:+x} ]; then

    echo "A container with the name ${DOCKER_RUN_NAME} is already running..."

    # Stops running container and deletes it.
    echo "Executing 'docker stop ${DOCKER_RUN_NAME}' ..."
    docker stop ${DOCKER_RUN_NAME} &> /dev/null

    echo "Executing 'docker rm ${DOCKER_RUN_NAME}' ..."
    docker rm ${DOCKER_RUN_NAME} &> /dev/null
fi

# mysql port 3306 is exposed by the base image, so we don't expose it here. See
# https://github.com/docker-library/mysql/blob/master/5.7/Dockerfile#L79
docker run -d --name=${DOCKER_RUN_NAME} -e MYSQL_USER=${MYSQL_USER} \
    -e MYSQL_ROOT_PASSWORD=${MYSQL_PASSWORD} -e MYSQL_PASSWORD=${MYSQL_PASSWORD} \
    -e MYSQL_DATABASE=${MYSQL_DATABASE} \
    --network=${DOCKER_NETWORK} \
    ${DOCKER_MANTAINER_NAME}/${DOCKER_NAME}:${DOCKER_TAG} 

docker logs -f ${DOCKER_RUN_NAME}
