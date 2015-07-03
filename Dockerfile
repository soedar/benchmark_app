FROM ruby:2.2.2

RUN echo Asia/Singapore > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV APP_HOME /benchmark_app/
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME
RUN bundle install --deployment --jobs=4

ADD . $APP_HOME
