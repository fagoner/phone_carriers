FROM ruby:2.4-onbuild

COPY . /opt/drecinos/app/phone_carriers

WORKDIR /opt/drecinos/app/phone_carriers

RUN bundle install -j 4 

CMD ["bundle", "exec", "rspec"]