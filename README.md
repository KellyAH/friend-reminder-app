# Friend Reminder

This rails app helps you keep track of your friends and what events you attended together.
In the future: It will send you email reminders for friends you have not spent time with in awhile.

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


## Envisioned Planned Architecture
![](architecture.png)


# Setup
### First Time Setup
## Local Environment - Don't do this right now. Wait for dockerfile to be fixed!
Requires Ruby 2.5.3. and Rails 6.0.2.1 - See [Gemfile](https://github.com/KellyAH/friend-reminder-app/blob/master/Gemfile)
You can get ruby from [here](https://www.ruby-lang.org/en/downloads/).
You can get rails from here - TBD

1. Clone down this repo: `git clone [repo_name]`
1. Go into the repo directory: `cd [repo_name]`
1. Install dependencies: `bundle install`

## Local Docker Environment - BROKEN RIGHT NOW
[Learn about Docker](https://semaphoreci.com/community/tutorials/dockerizing-a-ruby-on-rails-application)

1. Install [Docker Desktop for Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac)
1. Go into the repo directory: `cd [repo_name]`
1. Build Docker Image from Dockerfile: `docker build -t friend-reminder .`
1. Build and run Docker Container Image from Docker Image `docker container run`
Rails server will auto start. 


# Start Server
## Local Server
1. `rails server` or `bundle exec rails server`


## Local Docker Server  - BROKEN RIGHT NOW
1. Build and run Docker Container Image from Docker Image `docker container run`
rails server auto starts when running the docker container.

# Go to Front End

## on Local
* Go to Friends page [http://localhost:3000/friends](http://localhost:3000/friends)
* Go to Events page [http://localhost:3000/events](http://localhost:3000/events)

## on Production
* Go to Friends page [https://friend-reminder-app.herokuapp.com/friends](https://friend-reminder-app.herokuapp.com/friends)
* Go to Events page [https://friend-reminder-app.herokuapp.com/events](https://friend-reminder-app.herokuapp.com/events)