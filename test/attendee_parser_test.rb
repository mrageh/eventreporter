require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/attendee_parser"
require "csv"
require 'pry'

class AttendeeParserTest < MiniTest::Test
  def test_it_exists
    assert AttendeeParser
  end

  def test_it_parses_a_data_file
    ap = AttendeeParser.new
    attendees_parsed = ap.parse_file('./data/event_attendees.csv')
    assert_equal 19, attendees_parsed
  end

  def test_the_attendee_data_is_accessible
    ap = AttendeeParser.new
    attendees_parsed = ap.parse_file('./data/event_attendees.csv')
    attendee = ap.attendees.first
    assert_equal "Allison", attendee.first_name
    assert_equal "Nguyen", attendee.last_name
    assert_equal "arannon@jumpstartlab.com", attendee.email_address
    assert_equal "6154385000", attendee.homephone
    assert_equal "3155 19th St NW", attendee.street
    assert_equal "Washington", attendee.city
    assert_equal "DC", attendee.state
    assert_equal "20010", attendee.zipcode
  end

end
