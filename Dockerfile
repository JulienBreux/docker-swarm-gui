FROM ruby:2.3-onbuild

MAINTAINER Julien Breux <julien.breux@gmail.com>

EXPOSE 8080
CMD []

ENV APPSERVER thin
ENV RACK_ENV production

ENTRYPOINT bundle exec rackup \
    -p 8080 /usr/src/app/config.ru -s $APPSERVER -E $RACK_ENV
