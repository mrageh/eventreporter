class Printer
  def header
    "LAST NAME FIRST NAME EMAIL ZIPCODE CITY STATE ADDRESS PHONE"
  end
  def format_attendee(attendee)
    [attendee.first_name,
      attendee.last_name,
      attendee.email,
      attendee.zipcode,
      attendee.city,
      attendee.state,
      attendee.street,
      attendee.phone].join(" ")
  end

  def format_attendees(attendees)
    attendees.map {|attendee| format_attendee(attendee)}.join('\n')
  end

  def print_attendees(attendees)
    puts format_attendees(attendees)
  end
end
