FROM ruby:2.4.1

ENV PHONE_CARRIERS_PORT 4567
EXPOSE $PHONE_CARRIERS_PORT

COPY . /opt/drecinos/app/phone_carriers

WORKDIR /opt/drecinos/app/phone_carriers

RUN bundle install -j 4 

CMD ["rackup", "-o", "0.0.0.0", "-p", "4567"]