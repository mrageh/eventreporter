require "./lib/command_runner"

class CommandInterpreter
  attr_reader :runner

  def initialize(runner_input = CommandRunner)
    @runner = runner_input.new
  end

  def default_filename
    './data/event_attendees.csv'
  end

  def run(command)
    parts  = command.split
    instruction = parts[0]
    case instruction
      when "load"
        run_load(parts)
      when "queue"
        run_queue(parts[1..-1])
      when "help"
        run_help(parts[1..-1])
      when "find"
        run_find(parts[1..-1])
      else
        "sorry I don't know how to do that #{instruction}"
    end
  end

  def run_queue(parts)
    case parts.first
      when 'print'
        order = parts.last
        runner.queue_print(order)
      when 'count'
        runner.queue_count
      when 'clear'
        runner.queue_clear
      when 'save'
        filename = parts.last
        runner.queue_save(filename)
    end
  end

  def run_load(parts)
    filename = parts[1] || default_filename
    runner.load(filename)
  end

  def run_help(parts)
    case parts.first
      when nil
        runner.help
      else
        command = parts.join(" ")
        runner.help_for_command(command)
    end
  end

  def run_find(parts)
    attribute = parts.shift
    criteria = parts.join(' ')
    runner.send("find_#{attribute}", criteria)
  end

end
