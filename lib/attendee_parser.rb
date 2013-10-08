require_relative "attendee"
require "csv"

class AttendeeParser
   attr_reader :attendees, :data

  def parse_file(filename)
    open_file(filename)
    @attendees = data.collect { |line| build_attendee(line) }
    @attendees.count
  end

  def open_file(filename)
    @data = CSV.open(filename, :headers => true, :header_converters => :symbol)
  end

  def build_attendee(line)
    Attendee.new(:first_name => line[:first_name],
                 :last_name   => line[:last_name],
                 :email_address => line[:email_address],
                 :homephone => line[:homephone],
                 :street     => line[:street],
                 :city       => line[:city],
                 :state      => line[:state],
                 :zipcode    => line[:zipcode])
  end
end
