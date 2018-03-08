FROM ruby:2.4.1

WORKDIR /opt/src

ADD . /opt/src

RUN bundle install -j 4

CMD [ "bundle", "exec", "rspec" ]