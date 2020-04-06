#!/bin/sh

mkdir -p tmp/pids

bundle check || bundle install

until nc -z $DATABASE_HOST $DATABASE_PORT; do sleep 1;done

rm -f tmp/pids/server.pid
bundle exec rails db:create db:migrate
bundle exec rails s -b 0.0.0.0

