require_relative "attendee"
require "csv"

class AttendeeParser
   attr_reader :attendees, :data

  def open_file(filename)
    @data = CSV.open(filename, :headers => true, :header_converters => :symbol)
  end

  def parse_file(filename)
    open_file(filename)
    @attendees = data.collect { |line| build_attendee(line) }
    @attendees.count
  end

  def build_attendee(row)
    Attendee.new(:first_name => row[:first_name],
                 :last_name   => row[:last_name],
                 :email_address => row[:email_address],
                 :homephone => row[:homephone],
                 :street     => row[:street],
                 :city       => row[:city],
                 :state      => row[:state],
                 :zipcode    => row[:zipcode])
  end
end
