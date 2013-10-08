require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/attendee"
require "pry"

class AttendeeTest < Minitest::Test

  def test_the_phone_number_is_cleaned
    @at = Attendee.new(:phone => "11234567890" )
    cleaned = @at.clean_phone_number('11234567890')
    assert_equal '1234567890', cleaned
  end

  def test_the_zip_code_is_cleaned
    @at = Attendee.new(:zipcode => "11234567890" )
    cleaned = @at.clean_zip_code('11234567890')
    assert_equal '11234', cleaned
  end

end
