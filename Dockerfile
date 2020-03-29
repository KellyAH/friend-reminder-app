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

# install rails?
RUN gem install rails bundler
COPY Gemfile Gemfile.lock ./
COPY Gemfile Gemfile
RUN gem install bundler && bundle install

# Copy the main application.
COPY . ./

# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]