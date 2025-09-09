#!/bin/sh
set -e

# Build the Jekyll site
bundle exec jekyll build

# Start a Ruby server that maps the /blog path and adds a redirect from the root
exec ruby -r webrick -e "s = WEBrick::HTTPServer.new(Port: 4000, BindAddress: '0.0.0.0'); s.mount('/blog', WEBrick::HTTPServlet::FileHandler, './_site'); s.mount_proc('/') { |req, res| res.set_redirect(WEBrick::HTTPStatus::MovedPermanently, '/blog/') }; trap('INT'){s.shutdown}; s.start"
