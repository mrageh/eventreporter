class Attendee
  attr_accessor :first_name, :last_name,
                :zipcode, :city,
                :state, :phone,
                :email, :street

  def initialize(row)
    @first_name = row[:first_name]
    @last_name  = row[:last_name]
    @email      = row[:email_address]
    @phone      = clean_phone_number(row[:homephone])
    @street     = row[:street]
    @city       = row[:city]
    @state      = row[:state]
    @zipcode    = clean_zip_code(row[:zipcode])
  end

  def clean_zip_code(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def clean_phone_number(number)
    if number
      number = number.scan(/[0-9]/).join
      number = number[1..-1] if number.length == 11 && number.start_with?("1")
    else
      number = "0000000000"
    end
    number
  end

end
