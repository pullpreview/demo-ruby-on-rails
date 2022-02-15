# Use the barebones version of Ruby 2.2.3.
FROM ruby:2.7-slim

MAINTAINER Cyril Rohr <support@pullpreview.com>

# Install dependencies:
RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev postgresql-client

# Set an environment variable to store where the app is installed to inside
# of the Docker image.
ENV INSTALL_PATH /app
RUN mkdir -p $INSTALL_PATH

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR $INSTALL_PATH

# Ensure gems are cached and only get updated when they change. This will
# drastically increase build times when your gems do not change.
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

# Copy in the application code from your work station at the current directory
# over to the working directory.
COPY . .

# Provide dummy data to Rails so it can pre-compile assets.
RUN bundle exec rake RAILS_ENV=production DATABASE_URL=postgresql://user:pass@127.0.0.1/dbname SECRET_TOKEN=pickasecuretoken assets:precompile

# The default command that gets ran will be to start the Unicorn server.
CMD ./docker/web

EXPOSE 3000