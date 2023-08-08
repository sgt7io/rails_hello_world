# Use the official Ruby image from Docker Hub
FROM ruby:3.1.2

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y build-essential nodejs

# Install Rails gem
RUN gem install rails

# Install Bundler
RUN gem install bundler

COPY Gemfile* ./

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install Ruby gems
RUN bundle install

# Copy the rest of the application code to the container
COPY . /app

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]

