require_relative '../app.rb'
require 'json'

include Rack::Test::Methods
def app() 
  PhoneCarriers
end

describe "PhoneCarriers SinatraRb" do

  it "should allow accessing the home page" do
    get '/test?number=+50250191704'

    parse_result = JSON.parse(last_response.body)    
    expect(parse_result['ok']).to eql(true)

    expect(parse_result['country'].empty?).not_to       eql(true)
    expect(parse_result['country_code'].empty?).not_to  eql(true)
    expect(parse_result['human_type'].empty?).not_to    eql(true)
    expect(parse_result['national'].empty?).not_to      eql(true)
  end
end