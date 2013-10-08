require 'minitest/autorun'
require 'minitest/pride'
require './lib/printer'

class PrinterTest < Minitest::Test
  attr_reader :printer, :attendee

  def test_it_prints_a_header
    printer         = Printer.new
    expected_header = "LAST NAME FIRST NAME EMAIL ZIPCODE CITY STATE ADDRESS PHONE"
    assert_equal expected_header, printer.header
  end

  def joe_attendee
    Attendee.new( :first_name => "Joe",
                  :last_name  => "Schmo",
                  :email_address      => "ad@example.com",
                  :zipcode    => "80204",
                  :city       => "denver",
                  :state      => "Colorado",
                  :street     => "123 First Street",
                  :homephone  => "202-555-5555")
  end

  def jane_attendee
    Attendee.new( :first_name => "Jane",
                  :last_name  => "Scot",
                  :email_address      => "ad@example.com",
                  :zipcode    => "80204",
                  :city       => "denver",
                  :state      => "Colorado",
                  :street     => "123 First Street",
                  :homephone  => "252-555-5555")
  end

  def test_it_formats_an_attendee
    printer  = Printer.new
    attendee = joe_attendee
    expected ="Joe Schmo ad@example.com 80204 denver Colorado 123 First Street 2025555555"
    assert_equal expected, printer.format_attendee(attendee)
  end

  def test_it_formats_multiple_attendees
    printer  = Printer.new
    attendees = [joe_attendee, jane_attendee]

    expected_1 = "Joe Schmo ad@example.com 80204 denver Colorado 123 First Street 2025555555"
    expected_2 = "Jane Scot ad@example.com 80204 denver Colorado 123 First Street 2525555555"
    expected = [expected_1, expected_2].join('\n')

    assert_equal expected, printer.format_attendees(attendees)
  end

  def test_it_has_a_print_attendees_method
    printer = Printer.new
    assert printer.respond_to?(:print_attendees)
  end
end
