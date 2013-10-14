require "./lib/attendee_parser"
require "./lib/registry"
require "./lib/queue"
require "./lib/help"

class CommandRunner

  def parser
    @parser ||= AttendeeParser.new
  end

  def registry
    @registry ||= Registry.new
  end

  def queue
    @queue ||= Queue.new
  end

  def printer
    @printer ||= Printer.new
  end

  def help
    @help ||= Help.new
  end

  def load(filename)
    parser.parse_file(filename)
    registry.attendees = parser.attendees
    "Loaded #{registry.count} attendees."
  end

  def attendee_count
    registry.count #Law of Demeter Violation
  end

#./data/event_attendees.csv
  def queue_count
    queue.count
  end

  def queue_clear
    queue.clear
  end

  def queue_print(order)
    printer.print_attendees(queue.data)
  end

  def help_find
    help.find
  end

  def help_queue_clear
    help.queue_clear
  end

  def help_queue_count
    help.queue_count
  end

  def help_queue_print
    help.queue_print
  end

  def find_attendees_by_first_name(name)
    queue.replace(registry.find_all_by_first_name(name))
  end

  def find_attendees_by_last_name(name)
    queue.replace(registry.find_all_by_last_name(name))
  end

  def find_attendees_by_street(street)
    queue.replace(registry.find_all_by_street(street))
  end

  def find_attendees_by_email(email)
    queue.replace(registry.find_all_by_email(email))
  end

  def find_attendees_by_phone(phone)
    queue.replace(registry.find_all_by_phone(phone))
  end

  def find_attendees_by_city(city)
    queue.replace(registry.find_all_by_city(city))
  end

  def find_attendees_by_zipcode(zipcode)
    queue.replace(registry.find_all_by_zipcode(zipcode))
  end

  def find_attendees_by_state(state)
    queue.replace(registry.find_all_by_state(state))
  end

end
