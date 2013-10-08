require 'minitest/autorun'
require 'minitest/pride'
require './lib/registry'

class RegistryTest < Minitest::Test
  attr_reader :registry

  def setup
    @registry = Registry.new
  end

  def test_it_finds_attendees_by_first_name
    registry.attendees = [
      Attendee.new(:first_name => "SaRaH"),
      Attendee.new(:first_name => "sarah"),
      Attendee.new(:first_name => "daniel")
    ]
    attendees = registry.find_all_by_first_name("Sarah")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal 'sarah', attendee.first_name.downcase
    end
  end

  def test_it_finds_attendees_by_last_name
    registry.attendees = [
      Attendee.new(:last_name => "SaRaH"),
      Attendee.new(:last_name => "sarah"),
      Attendee.new(:last_name => "daniel")
    ]
    attendees = registry.find_all_by_last_name("Sarah")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal 'sarah', attendee.last_name.downcase
    end
  end

  def test_it_finds_attendees_by_homephone
    registry.attendees = [
      Attendee.new(:homephone => "12345678901"),
      Attendee.new(:homephone => "12345678901"),
      Attendee.new(:homephone => "1234567890")
    ]
    attendees = registry.find_all_by_homephone("2345678901")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal '2345678901', attendee.homephone
    end
  end

  def test_it_finds_attendees_by_zipcode
    registry.attendees = [
      Attendee.new(:zipcode => "12345678901"),
      Attendee.new(:zipcode => "12345678901"),
      Attendee.new(:zipcode => "1234")
    ]
    attendees = registry.find_all_by_zipcode("12345")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal '12345', attendee.zipcode
    end
  end

  def test_it_finds_attendees_by_city
    registry.attendees = [
      Attendee.new(:city => "denver"),
      Attendee.new(:city => "DenVer"),
      Attendee.new(:city => "chicago")
    ]
    attendees = registry.find_all_by_city("denver")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal 'denver', attendee.city.downcase
    end
  end

  def test_it_finds_attendees_by_state
    registry.attendees = [
      Attendee.new(:state => "CoLorado"),
      Attendee.new(:state => "CoLorado"),
      Attendee.new(:state => "chicago")
    ]
    attendees = registry.find_all_by_state("CoLorado")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal 'colorado', attendee.state.downcase
    end
  end

  def test_it_finds_attendees_by_street
    registry.attendees = [
      Attendee.new(:street => "DeLaWare"),
      Attendee.new(:street => "DeLaWare"),
      Attendee.new(:street => "chicago")
    ]
    attendees = registry.find_all_by_street("DeLaWare")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal 'delaware', attendee.street.downcase
    end
  end

  def test_it_finds_attendees_by_email_address
    registry.attendees = [
      Attendee.new(:email_address => "pinalevitsky@jumpstartlab.com"),
      Attendee.new(:email_address => "pinalevitsky@jumpstartlab.com"),
      Attendee.new(:email_address => "adan@jumpstartlab.com")
    ]
    attendees = registry.find_all_by_email_address("pinalevitsky@jumpstartlab.com")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal 'pinalevitsky@jumpstartlab.com', attendee.email_address.downcase
    end
  end

  end
