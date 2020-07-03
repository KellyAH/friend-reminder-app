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
# Forcefully delete the container if it exists - this will automatically stop it
# This allows the script to be run repeatadly.
docker container rm -f ${container_name} > /dev/null 2>&1 || true

# Delete server.pid in local repo so it isn't copied into the container which will prevent rails from starting.
FILE=tmp/pids/server.pid
if [ -f "$FILE" ]; then
  rm $FILE
  echo "Deleted $FILE in local repo."
fi

#
## -- SET-UP --
# Build image from Dockerfile.
docker build -t ${image_name_and_tag} .

# Use docker image to build and start the container. This also starts the rails server
# container must run in detached mode else exec commands won't execute
docker container run -d --name ${container_name} -v $PWD:/friend_reminder_app:cached -p 3000:3000 ${image_name_and_tag}

# wait for rails server to spin up
sleep 5

# run command inside the running container to create an empty database
docker exec ${container_name} sh -c "RAILS_ENV=development rails db:create db:migrate"

echo "${container_name} is now running. You can see the front end at: http://localhost:3000/friends"
echo "Tail the server logs via: docker container logs -f friend-reminder-app"
#TODO: create and run seed data so devs don't need to keep creating their own data manually ${container_name} -v $PWD:/friend_reminder_app -p 3000:3000 ${image_name_and_tag}