require 'minitest/autorun'
require 'minitest/pride'
require './lib/help'
require "pry"
class HelpTest < Minitest::Test
  attr_reader :help
  def setup
    @help = Help.new
  end

  def test_queue_clear
    command = "This command empties out the queue"
    assert_equal command, help.queue_clear
  end

  def test_queue_count
    command = "This command counts the number of attendees in the queue"
    assert_equal command, help.queue_count
  end

  def test_queue_print
    command = "This command prints the number of attendees in the queue"
    assert_equal command, help.queue_print
  end

  def test_find
    command = "This command finds attendees by attribute"
    assert_equal command, help.find
  end


end
