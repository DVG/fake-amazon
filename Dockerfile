FROM ruby:2.4

RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y libxml2-dev libxslt1-dev
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb
RUN apt-get install -y nodejs imagemagick

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile Gemfile.lock $APP_HOME/
RUN bundle install
