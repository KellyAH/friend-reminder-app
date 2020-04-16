#TODO fix this. not sure if rails is really being installed.
# or if this is the correct way to build rails in docker


FROM ruby:2.5.3
MAINTAINER k_ahong@yahoo.com

# Install apt based dependencies required to run Rails as
# well as RubyGems. As the Ruby image itself is based on a
# Debian image, we use apt-get to install those.
RUN apt-get update && apt-get install -y

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
RUN mkdir -p /friend_reminder_app
WORKDIR /friend_reminder_app

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.

# Copy the main application.
COPY . ./
#RUN pwd
#RUN cd ..
#RUN ls
#COPY ../Gemfile.lock ./
#COPY ../Gemfile ./

# NOTE: if need to use webpacker for JS FE stuff, uncomment webpacker in gemfile and install node, install yarn

#HWK: update ruby to 2.7.1 install on personal mac and work mac
# install ruby 2.7.1 via rbenv
# update ruby version FROM in Dockerfile
# create .ruby-version file
# update ruby version in Gemfile
# move to a new tab in terminal app
# gem install bundler
# bundle


# install rails?
# RUN gem install rails bundler
RUN gem install bundler && bundle install


# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
