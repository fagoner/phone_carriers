require 'sinatra/base'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each do |file| 
  require file 
end


class PhoneCarriers < Sinatra::Base

  def initialize
    super
    @phone_library = Phone.new
  end

  get  '/test' do
    content_type :json

    number      = params['number'].to_s
    test_result = @phone_library.validate(number)
    
    test_result.to_json
  end
  


end