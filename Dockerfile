# Base image
FROM ruby:3.3

# Set environment variables
ENV APP_HOME /app
ENV LANG C.UTF-8
ENV BUNDLE_JOBS=4

# Install build dependencies
RUN apt update \
    && apt install -y build-essential \
    && apt install -y ruby-dev \
    && apt install -y zlib1g-dev \
    && apt install -y libxml2-dev \
    && apt install -y libxslt-dev \
    && apt install -y tzdata \
    && apt install -y nodejs \
    && apt install -y yarn \
    && apt install -y git \
    && gem update --system

# Set the working directory
WORKDIR $APP_HOME

# Copy the project files
COPY . $APP_HOME/

# Install Gems
COPY Gemfile* $APP_HOME/
RUN git clone https://github.com/rizwan95/jekyll-seo-tag.git
RUN rm -f Gemfile.lock
RUN gem install bundler && bundle install

# Expose port 4000
EXPOSE 4000

# Run Jekyll
CMD ["jekyll", "serve", "--host", "0.0.0.0"]
