#!/bin/bash
set -e

# This script will run the friend reminder app rails server inside a container
# and map the container port to your local so you can see the rails front end on your local.
# and mount your local repo to the container so local changes are reflected in the container.

image_name="friend-reminder"
image_name_and_tag="friend-reminder:latest"
container_name="friend-reminder-app"

# NOTE: In the future when sidekiq and sendgrid is setup - rewrite this to work with docker compose.
# See https://github.com/jfahrer/dockerizing_rails/tree/dockerized

#
## -- PRE-CLEAN UP --

# Stops and deletes the friend-reminder-app container only if its running.
# This allows the script to be run repeatadly.

# Forcefully delete the container if it exists - this will automatically stop it
docker container rm -f ${container_name} > /dev/null 2>&1 || true

#TODO delete container if it's not running but it exists
# TEST IF THIS WORKS
#if [ "$(docker ps -aq --filter "name=${container_name}" 2>/dev/null)" = "true" ];
#  then
#    docker container rm ${container_name} > /dev/null 2>&1
#    echo "PRE-CLEAN UP: Deleted ${container_name} container."
#  else
#    echo "no pre clean up needed"
#fi

#
## -- SET-UP --

# Build image from Dockerfile.
docker build -t ${image_name_and_tag} .

# Use docker image to spin up container.
# This will also start the rails server.
# This must run in detached mode else the belwo migration command won't ever execute.
#docker container run -d --name ${container_name} -p 3000:3000 ${image_name_and_tag}

# build and start container and start rails server
# container must run in detached mode else exec commands won't execute
docker container run -d --name ${container_name} -v $PWD:/friend_reminder_app:cached -p 3000:3000 ${image_name_and_tag}

# wait for rails server to spin up
sleep 5

# run command inside the running container to create an empty database
docker exec ${container_name} sh -c "RAILS_ENV=development rails db:create db:migrate"

echo "${container_name} is now running. You can see the front end at: http://localhost:3000/friends"
echo "Tail the server logs via: docker container logs -f friend-reminder-app"
#TODO: create and run seed data so devs don't need to keep creating their own data manually ${container_name} -v $PWD:/friend_reminder_app -p 3000:3000 ${image_name_and_tag}