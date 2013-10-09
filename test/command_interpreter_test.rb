require 'minitest/autorun'
require 'minitest/pride'
require './lib/command_interpreter'
require "pry"

class CommandInterpreterTest < Minitest::Test
  attr_reader :ci
  class FakeCommandRunner
    def load(filename)
      "running load with #{filename}"
    end

    def queue_print(order)
      "running queue print ordered by #{order}"
    end

    def queue_count
      "running queue count"
    end

    def queue_clear
      "running queue clear"
    end

    def queue_save_to(filename)
      "running queue save to #{filename}"
    end

    def help(command = nil)
      if command.nil?
        "running help"
      else
        "running help for the #{command} command"
      end
    end

    #Only test one of the find methods!!!!!
    def find_first_name(attribute)
      "running find by first_name for #{attribute}"
    end

  end

  def setup
    @ci = CommandInterpreter.new(FakeCommandRunner)
  end

  def test_it_accepts_a_load_instruction
    command = "load some_data.csv"
    results = ci.run(command)
    assert_equal "running load with some_data.csv", results
  end

  def test_it_runs_load_without_a_filename
    result = ci.run('load')
    assert_equal 'running load with event_attendees.csv',result
  end

  def test_it_prints_ordered_by_the_last_name
    result = ci.run("queue print by last_name")
    assert_equal 'running queue print ordered by last_name', result
  end

  def test_it_counts_the_queue
    result = ci.run("queue count")
    assert_equal 'running queue count', result
  end

  def test_it_clear_the_queue
    result = ci.run("queue clear")
    assert_equal 'running queue clear', result
  end

  def test_it_shows_all_help_commands
    result = ci.run("help")
    assert_equal 'running help', result
  end

  def test_it_shows_specific_help_commands
    command = "help queue count"
    result  = ci.run(command)
    assert_equal "running help for the queue count command", result
  end

  def test_queue_save_to_file
    command = 'queue save to some.csv'
    result = ci.run(command)
    assert_equal 'running queue save to some.csv', result
  end

  def test_it_finds_first_name
    result = ci.run("find first_name Sam")
    assert_equal "running find by first_name for Sam", result
  end

end
