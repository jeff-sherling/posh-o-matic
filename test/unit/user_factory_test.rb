$:.push '../../lib/data'
$:.push '../../lib/log'
require 'user_factory'
require 'minitest/autorun'
require 'minitest/reporters'
require 'console'

class UserFactoryTest < Minitest::Test

  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new,
                            Minitest::Reporters::JUnitReporter.new
                           ]

  def test_name
    name = UserFactory.get_name 12
    Console.log.info "Name: #{name}"
    assert(name.size == 12, 'Name should be 12 characters.')
  end

  def test_name_argument_value
    assert_raises(RuntimeError, 'Fixnum should be > 0.') {UserFactory.get_name 0}
  end

  def test_name_argument_fixnum
    assert_raises(RuntimeError, 'Argument should be a Fixnum.') {UserFactory.get_name 'a'}
  end

  def test_initial
    initial = UserFactory.get_name 1
    Console.log.info "Initial: #{initial}"
    assert(initial.size == 1, 'Initial should only be 1 character.')
  end

  def test_email
    email = UserFactory.get_email
    Console.log.info "Email: #{email}"
    assert(email.size == 41, 'Default email size is 41 characters.')
  end

  def test_birth_date
    date = UserFactory.get_birth_date
    Console.log.info "Date: #{date}"
    assert(date.size == 10, 'Date should be 10 characters long.')
  end

  def test_birth_day
    day = UserFactory.get_birth_day
    Console.log.info "Day: #{day}"
    assert(day.size == 2, 'Day should be 2 characters long.')
  end

  def test_birth_day_value
    day = UserFactory.get_birth_day_value
    Console.log.info "Day: #{day}"
    assert(day.size >= 1 && day.size <= 2, 'Day should be 1-2 characters long.')
  end

  def test_birth_month
    month = UserFactory.get_birth_month
    Console.log.info "Month: #{month}"
    assert(month.size == 2, 'Month should be 2 characters long.')
  end

  def test_birth_month_value
    month = UserFactory.get_birth_month_value
    Console.log.info "Month: #{month}"
    assert(month.size >= 1 && month.size <= 2, 'Month should be 1-2 characters long.')
  end

  def test_birth_year
    year = UserFactory.get_birth_year
    Console.log.info "Year: #{year}"
    assert(year.size == 4, 'Year should be 4 characters long.')
  end

  def test_minor_birth_date
    date = UserFactory.get_minor_birth_date
    Console.log.info "Date: #{date}"
    assert(date.include?('12/31/') && date.size == 10, 'Date should be 10 characters long.')
  end

  def test_zip_code
    zip = UserFactory.get_zip_code
    Console.log.info "Zip: #{zip}"
    assert(zip.size == 5, 'Zip code should be 5 characters long.')
  end

  def test_invalid_email
    email = UserFactory.get_invalid_email
    Console.log.info "Invalid email: #{email}"
    assert_includes(email, 'mailinator', 'Email address should include mailinator.')
  end

  def test_ssn
    ssn = UserFactory.get_ssn
    Console.log.info "SSN: #{ssn}"
    assert(ssn.size == 9, 'SSN should be 9 characters long.')
  end

  def test_phone
    phone = UserFactory.get_phone
    Console.log.info "Phone: #{phone}"
    assert(phone.size == 10, 'Phone should be 10 characters long.')
  end

  def test_address1
    address = UserFactory.get_address1
    Console.log.info "Address 1: #{address}"
    assert(address.size >= 10, 'Address1 size should be 10 characters or longer.')
  end

  def test_address2
    room = UserFactory.get_address2
    Console.log.info "Address 2: #{room}"
    assert(room.size >= 5, 'Address2 should be 5 characters or longer.')
  end

  def test_state
    state = UserFactory.get_state
    Console.log.info "State: #{state}"
    assert(state.size == 2, 'State should be two-letter abbreviation.')
  end

end