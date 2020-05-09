FROM ruby:2.7.1
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

# Copy the main application.
COPY . ./

RUN gem install bundler && bundle install

# set rails env for development
ENV RAILS_ENV development

# build database
RUN rails db:migrate

# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
