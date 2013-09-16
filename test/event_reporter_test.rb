require "minitest"
require "minitest/autorun"
require "./event_reporter"

class EventReporterTest < MiniTest::Test
  def test_it_exists
    #Assignments & Actions
    em = EventReporter.new
    #Assertions
    assert_kind_of EventReporter, em
  end
end