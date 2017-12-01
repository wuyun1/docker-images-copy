#!/bin/bash

# docker pull registry.saas.hand-china.com/google_containers/kubernetes-dashboard-init-amd64:v1.0.0

# docker tag registry.saas.hand-china.com/google_containers/kubernetes-dashboard-init-amd64:v1.0.0 gcr.io/google_containers/kubernetes-dashboard-init-amd64:v1.0.0




DOCKER_TO_PROJECT=gcr.io/google_containers
DOCKER_FROM_PROJECT=registry.saas.hand-china.com/google_containers2
RENAME_IMAGES=kubernetes-dashboard-amd64:v1.8.0,pause-amd64:3.0


OLD_IFS="$IFS"
IFS=","
RENAME_IMAGES_TO_ARR=($RENAME_IMAGES)
IFS="$OLD_IFS"

for s in ${RENAME_IMAGES_TO_ARR[@]}
do
  docker pull ${DOCKER_FROM_PROJECT}/${s}
  docker tag ${DOCKER_FROM_PROJECT}/${s} ${DOCKER_TO_PROJECT}/${s}
done
docker images -a 

