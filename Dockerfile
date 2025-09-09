# Use an official Ruby image
FROM ruby:3.2-alpine

# Install build dependencies
RUN apk add --no-cache build-base git

# Set the working directory
WORKDIR /srv/jekyll

# Install bundler
RUN gem install bundler -v 2.5.10

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose port 4000
EXPOSE 4000

# The main command to run Jekyll
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
