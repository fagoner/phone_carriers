require 'phonelib'
require 'phonelib/version'

class Phone
  
  def version
    Phonelib::VERSION
  end
  
  def validate(number)
    result = Phonelib.parse(number)

    {
      ok:               result.valid?,
      country:          result.country.to_s,
      country_code:     result.country_code.to_s,
      human_type:       result.human_type.to_s,
      national:         result.national.to_s,
      phonelib_version: version
    }
  end


end