# Friend Reminder

This rails app helps you keep track of your friends and what events you attended together.
In the future: It will send you email reminders for friends you have not spent time with in awhile.

* [Installation](#installation)
* [Local Docker Environment Setup](#local-docker-environment)
  * [About Docker](#about-docker)
* [Start Server](#start-server)
* [Troubleshooting](#troubleshooting)
* [ToDo](#todo)
  * [Envisioned Architecture](#envisioned-architecture)

# Installation
The app runs on Ruby 2.5.3. and Rails 6.0.2.1.

## Local Docker Environment
1. Install [Docker Desktop for Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac)
1. Go into the repo directory: `cd [repo_name]`
1. Build a Docker Image from the Dockerfile: `docker build -t friend-reminder:latest .`
1. Build and run a Docker Container from the Docker Image
```
docker container run --name friend-reminder-app -v [path to your local repo]:/friend_reminder_app -p 3000:3000 friend-reminder:latest
```
This will start the rails server for the friend reminder app inside a Docker Container.
And map the Rails server port inside the container to your local so you can see the app running in the container by going to:
* Go to Friends page [http://localhost:3000/friends](http://localhost:3000/friends)
* Go to Events page [http://localhost:3000/events](http://localhost:3000/events)

It also mounts your local repo to the repo inside the container so changes made on your local are reflected in the running container.

To stop the server and the container it's running in: `Ctrl+C`

### Troubleshooting
See if the container is running: `docker container ls -a`
* If STATUS is: `Exited` then the container has stopped.
* If STATUS is: `Up` then the container is running and the Rails server is running.

To start the container and the rails server up again:
1. Get the `CONTAINER ID` via: `docker container ls -a`
1. start the rails server and the container it runs in: `docker container start [CONTAINER ID]`

To stop the rails server and the container it runs in: `docker container stop [CONTAINER ID]`

Start a shell running in the container to look at the files inside it:
In a new terminal window run: `docker container exec -it friend-reminder-app sh`
* To exit: `exit + ENTER key`

Tail logs for the rails server inside the container via: `docker container logs -f [CONTAINER ID]`
* To stop tailing logs: `Ctrl+C`

### About Docker
New to Docker? Learn the big picture [here](https://www.youtube.com/watch?v=CcxbHkqzJuI&t=31s) and about Dockerfiles  [here](https://www.youtube.com/watch?v=-2X4JP3HgYU&t=5s).
Check out free video tutorials [here](https://learndocker.online)
[Docker reference] (https://towardsdatascience.com/15-docker-commands-you-should-know-970ea5203421)

# Start Server
## Local Docker Environment
Rails server automatically starts when running the container. See [Local Docker Environment Setup](#local-docker-environment).

# Go to the Front End

## In Local Docker Environment
* Go to Friends page [http://localhost:3000/friends](http://localhost:3000/friends)
* Go to Events page [http://localhost:3000/events](http://localhost:3000/events)

## on Production in Heroku
* Go to Friends page [https://friend-reminder-app.herokuapp.com/friends](https://friend-reminder-app.herokuapp.com/friends)
* Go to Events page [https://friend-reminder-app.herokuapp.com/events](https://friend-reminder-app.herokuapp.com/events)


## ToDo
See [Friend-reminder-app Planning doc](https://docs.google.com/document/d/1RC6Yu1T5fuwjNYEb6hjdXqkopKkbILrpYNkQJKn10Cg/edit)

### What's done:
* CRUD friends and events pages
* set up deploys on heroku

### What still needs to be done:
 * setup email server - sendgrid templates
 * setup sidekick job scheduler
 * create unit tests
 * create front end tests - cypress?
 * make frontend pretties - bootstrap UI? react?
  
### Use Cases
As a user I can, go to an app FE and 
* See a list of all my friends (first name, last name, email, status [active, deactivated])
* Add a new friend
* Edit friend info (first name, last name, email, status [active, deactivated]
* Delete a friend should delete all events -  
* show a confirmation 1st warning that “deleting friend will delete all events”
* See the latest event I had with all my friends of pending, active, deactivated, or all status 
* See the latest event I had with a specific friend
* Add a new event for a friend (title, date_attended, note)
* Edit event info assigned to a friend
* Delete an event assigned to a friend
* See all events I had with a specific friend in 2 different places
* On friend details page
* And on events page

As a user I can, edit email message settings
* Config scheduled email sendings
* Enable / disable scheduled emails
* Edit email templates
* Unsubscribe from emails
* Receive an email at the beginning of each month, listing the active status friends I have and the last event I did with them and their email
* Receive an email every 6 months, listing the deactivated status friends I have and the last event I did with them and their email

Other:
* Do I need auth for logged in users? - future?

Minimum Viable Product
* FE & BE - CRUD friends list and events list
* Deploy basic rails app to heroku
* Send test email via sendgrid to my email


## Envisioned Architecture
![](architecture.png)