FROM ruby:2.6.2-alpine

RUN apk update && \
  apk -q --update --no-cache add \
  bc \
  build-base \
  openssh \
  bash \
  curl \
  netcat-openbsd \
  postgresql-client \
  postgresql-dev \
  graphviz && \
  gem install bundler -v 2.0.2

ADD ./rec/Gemfile /app/Gemfile
ADD ./rec/Gemfile.lock /app/Gemfile.lock
WORKDIR /app

RUN bundle install
ADD ./rec /app

CMD ["/app/docker-entrypoint.sh"]
