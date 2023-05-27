# Base image
FROM ruby:2.6-alpine

# Set environment variables
ENV APP_HOME /app
ENV LANG C.UTF-8
ENV BUNDLE_JOBS=4

# Install build dependencies
RUN apk update \
    && apk add --no-cache build-base \
    && apk add --no-cache ruby-dev \
    && apk add --no-cache zlib-dev \
    && apk add --no-cache libxml2-dev \
    && apk add --no-cache libxslt-dev \
    && apk add --no-cache tzdata \
    && apk add --no-cache nodejs \
    && apk add --no-cache yarn \
    && apk add --no-cache git \
    && gem update --system

# Set the working directory
WORKDIR $APP_HOME

# Install Gems
COPY Gemfile* $APP_HOME/
RUN gem install bundler && bundle install

# Copy the project files
COPY . $APP_HOME/

# Expose port 4000
EXPOSE 4000

# Run Jekyll
CMD ["jekyll", "serve", "--host", "0.0.0.0"]
