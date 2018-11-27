#!/bin/bash

. `dirname $0`/env.sh

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

docker run -d --name=${DOCKER_RUN_NAME} -e MYSQL_USER=${MYSQL_USER} \
    -e MYSQL_ROOT_PASSWORD=${MYSQL_PASSWORD} -e MYSQL_PASSWORD=${MYSQL_PASSWORD} \
    -e MYSQL_DATABASE=${MYSQL_DATABASE} -p ${MYSQL_PORT}:${MYSQL_PORT} \
    ${DOCKER_MANTAINER_NAME}/${DOCKER_NAME}:${DOCKER_TAG} 

docker logs -f ${DOCKER_RUN_NAME}
