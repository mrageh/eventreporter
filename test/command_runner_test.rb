require "minitest/autorun"
require "minitest/pride"
require "./lib/command_runner"

class CommandRunnerTest < Minitest::Test
  attr_reader :cr

  def setup
    @cr = CommandRunner.new
  end
  def test_it_loads_a_CSV_into_the_registry
    cr.load('./data/event_attendees.csv')
    assert_equal 19, cr.attendee_count
  end

  def test_it_counts_the_queue_when_empty
    assert_equal 0, cr.queue_count
  end

  def test_it_counts_the_loaded_queue
    cr.load('./data/event_attendees.csv')
    cr.find_attendees_by_first_name('Sarah')
    assert_equal 2, cr.queue_count
  end


end
