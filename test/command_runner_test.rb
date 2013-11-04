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

  def test_it_clears_the_queue
    cr.load('./data/event_attendees.csv')
    cr.find_first_name('Sarah')
    assert_equal 2, cr.queue_count
    assert_equal [], cr.queue_clear
    assert_equal 0, cr.queue_count
  end

  def test_it_replaces_queued_items_on_a_second_find
    cr.load('./data/event_attendees.csv')
    cr.find_first_name("Sarah")
    cr.find_first_name("Audrey")
    assert_equal 1, cr.queue_count
  end

  def test_help_command_find
    command = "This command finds attendees by attribute"
    assert_equal command, cr.help_find
  end

  def test_help_command_queue_clear
    command = "This command empties out the queue"
    assert_equal command, cr.help_queue_clear
  end

  def test_help_command_queue_count
    command = "This command counts the number of attendees in the queue"
    assert_equal command, cr.help_queue_count
  end

  def test_help_command_queue_print
    command = "This command prints the number of attendees in the queue"
    assert_equal command, cr.help_queue_print
  end

  def test_it_counts_the_loaded_queue_by_first_name
    cr.load('./data/event_attendees.csv')
    cr.find_first_name('Sarah')
    assert_equal 2, cr.queue_count
  end

  def test_it_counts_the_loaded_queue_by_last_name
    cr.load('./data/event_attendees.csv')
    cr.find_last_name('Okaty')
    assert_equal 1, cr.queue_count
  end

  def test_it_counts_the_loaded_queue_by_street
    cr.load('./data/event_attendees.csv')
    cr.find_street('1509 Jackson Street')
    assert_equal 1, cr.queue_count
  end

  def test_it_counts_the_loaded_queue_by_email
    cr.load('./data/event_attendees.csv')
    cr.find_email('ffbbieucf@jumpstartlab.com')
    assert_equal 1, cr.queue_count
  end

  def test_it_counts_the_loaded_queue_by_phone
    cr.load('./data/event_attendees.csv')
    cr.find_phone('6507990000') #see if you can improve find method
    assert_equal 1, cr.queue_count
  end

  def test_it_counts_the_loaded_queue_by_city
    cr.load('./data/event_attendees.csv')
    cr.find_city('Washington')
    assert_equal 2,cr.queue_count
  end

  def test_it_counts_the_loaded_queue_by_zipcode
    cr.load('./data/event_attendees.csv')
    cr.find_zipcode('20010')
    assert_equal 1, cr.queue_count
  end

  def test_it_counts_the_loaded_queue_by_state
    cr.load('./data/event_attendees.csv')
    cr.find_state('DC')
    assert_equal 2, cr.queue_count
  end

  def test_it_calls_queue_save_method
    cr = CommandRunner.new
    cr.load('./test/fixtures/partial_attendees.csv')
    cr.find_attendees_by_first_name("Sarah")
    assert cr.respond_to?(:queue_save)
  end

  def test_it_executes_the_queue_save_method
    cr = CommandRunner.new
    cr.load('./test/fixtures/partial_attendees.csv')
    cr.find_attendees_by_first_name("Sarah")
    assert "woot", cr.queue_save("new_file")
  end

end
