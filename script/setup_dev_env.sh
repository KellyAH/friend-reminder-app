#!/bin/bash

set -e

# kill and remove any existing running dev enviro container if it exists.
# WARN: this will wipe out any data in the db running in the container

# build image from Dockerfile
docker build -t friend-reminder:latest .

# use docker image to spin up container
docker container run --name friend-reminder-app -p 3000:3000 friend-reminder:latest


#docker container run --name friend-reminder-app -v $PWD:/friend_reminder_app -p 3000:3000 friend-reminder:latest

# create empty database
#docker exec -ti friend-reminder-app sh -c "rails db:migrate RAILS_ENV=development"

# start rails server
