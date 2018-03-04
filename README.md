# phone_carriers

A simple rest to valid a phone number
usage:

rackup -p 4567

curl localhost:4567/test?number?=+50250191704

Result:
{"ok":true,"country":"GT","country_code":"502","human_type":"Mobile","national":"5019 1704","phonelib_version":"0.6.18"}