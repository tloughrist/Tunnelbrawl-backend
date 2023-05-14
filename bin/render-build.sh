#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
# bundle exec rake assets:precompile
# bundle exec rake assets:clean

npm install --prefix client && npm run build --prefix client

bundle exec rake db:migrate

