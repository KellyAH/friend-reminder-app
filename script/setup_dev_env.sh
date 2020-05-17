#!/bin/bash
set -e
image_name="friend-reminder"
image_name_and_tag="friend-reminder:latest"
container_name="friend-reminder-app"

# NOTE: In the future when sidekiq and sendgrid is setup - rewrite this to work with docker compose.
# See https://github.com/jfahrer/dockerizing_rails/tree/dockerized

#
## -- PRE-CLEAN UP --

# Stops and deletes the friend-reminder-app container only if its running.
# This allows the script to be run repeatadly.
if [ "$(docker inspect -f '{{.State.Running}}' ${container_name} 2>/dev/null)" = "true" ];
  then
    docker container stop ${container_name} > /dev/null 2>&1
    docker container rm ${container_name} > /dev/null 2>&1
    echo "PRE-CLEAN UP: Stopped and deleted ${container_name} container."
  else
    echo "no pre clean up needed"
fi

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
docker container run -d --name ${container_name} -p 3000:3000 ${image_name_and_tag}

# TODO: fix $PWD in script so it works
#repo_directory=$(echo $PWD)
#docker container run -d --name ${container_name} -v ${repo_directory}:/friend_reminder_app -p 3000:3000 ${image_name_and_tag}


# run command inside the running container to create an empty database
docker exec ${container_name} sh -c "rails db:migrate RAILS_ENV=development"

echo "${container_name} is now running. You can see the front end at: http://localhost:3000/friends"
#TODO: create and run seed data so devs don't need to keep creating their own data manually