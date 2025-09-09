#!/bin/sh
set -e

# Build the site
bundle exec jekyll build

# Serve the site
bundle exec jekyll serve --host 0.0.0.0
