require 'minitest/autorun'
require 'minitest/pride'
require './lib/command_interpreter'
require "pry"

class CommandInterpreterTest < Minitest::Test
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
  end

  def test_it_accepts_a_load_instruction
    ci = CommandInterpreter.new(FakeCommandRunner)
    command = "load some_data.csv"
    results = ci.run(command)
    assert_equal "running load with some_data.csv", results
  end

  def test_it_runs_load_without_a_filename
    ci = CommandInterpreter.new(FakeCommandRunner)
    result = ci.run('load')
    assert_equal 'running load with event_attendees.csv',result
  end

  def test_it_prints_ordered_by_the_last_name
    ci = CommandInterpreter.new(FakeCommandRunner)
    result = ci.run("queue print by last_name")
    assert_equal 'running queue print ordered by last_name', result
  end

  def test_it_counts_the_queue
    ci = CommandInterpreter.new(FakeCommandRunner)
    result = ci.run("queue count")
    assert_equal 'running queue count', result
  end
end
