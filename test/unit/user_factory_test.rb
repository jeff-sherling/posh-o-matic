$LOAD_PATH.push 'lib/data'
$LOAD_PATH.push 'lib/log'
require 'user_factory'
require 'minitest/autorun'
require 'minitest/reporters'
require 'console'

# UserFactory unit tests.
class UserFactoryTest < Minitest::Test
  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new,
                            Minitest::Reporters::JUnitReporter.new]

  def test_name
    name = UserFactory.get_name 15
    Console.log.info "Name (15): #{name}"
    assert(name.size == 15, 'Name should be 15 characters.')
  end

  def test_name_default
    name = UserFactory.get_name
    Console.log.info "Name (default): #{name}"
    assert(name.size == 10, 'Default name should be 10 characters.')
  end

  def test_name_argument_error_when_zero
    assert_raises(RuntimeError, 'Fixnum should be > 0.') do
      UserFactory.get_name 0
    end
  end

  def test_name_argument_error_when_string
    assert_raises(RuntimeError, 'Argument should be a Fixnum.') do
      UserFactory.get_name 'a'
    end
  end

  def test_name_initial
    initial = UserFactory.get_name 1
    Console.log.info "Initial: #{initial}"
    assert(initial.size == 1, 'Initial should only be 1 character.')
  end

  def test_email
    email = UserFactory.get_email
    Console.log.info "Email: #{email}"
    assert(email.size == 41 && email.include?('@'),
           'Default email size is 41 characters.')
  end

  def test_invalid_email
    email = UserFactory.get_invalid_email
    Console.log.info "Invalid email: #{email}"
    assert_includes(email, 'mailinator',
                    'Email address should include mailinator.')
  end

  def test_birth_date
    date = UserFactory.birth_date
    Console.log.info "Date: #{date}"
    assert(date.size == 10, 'Date should be 10 characters long.')
  end

  def test_birth_day
    day = UserFactory.birth_day
    Console.log.info "Day (pad): #{day}"
    assert(day.size == 2, 'Day should be 2 characters long.')
  end

  def test_birth_day_value
    day = UserFactory.birth_day_value
    Console.log.info "Day (no pad): #{day}"
    assert(day.size >= 1 && day.size <= 2, 'Day should be 1-2 characters long.')
  end

  def test_birth_month
    month = UserFactory.birth_month
    Console.log.info "Month (pad): #{month}"
    assert(month.size == 2, 'Month should be 2 characters long.')
  end

  def test_birth_month_value
    month = UserFactory.birth_month_value
    Console.log.info "Month (no pad): #{month}"
    assert(month.size >= 1 && month.size <= 2,
           'Month should be 1-2 characters long.')
  end

  def test_minor_birth_year
    year = UserFactory.minor_birth_year
    Console.log.info "Minor year: #{year}"
    assert(year == (Time.new.year - 15).to_s, 'Years should match.')
  end

  def test_birth_year
    year = UserFactory.birth_year
    Console.log.info "Year: #{year}"
    assert(year.size == 4, 'Year should be 4 characters long.')
  end

  def test_minor_birth_date
    date = UserFactory.minor_birth_date
    Console.log.info "Minor date: #{date}"
    assert(date.include?('12/31/') && date.size == 10,
           'Date should be 10 characters long.')
  end

  def test_zip_code
    zip = UserFactory.zip_code
    Console.log.info "Zip: #{zip}"
    assert(zip.size == 5, 'Zip code should be 5 characters long.')
  end

  def test_ssn
    ssn = UserFactory.ssn
    Console.log.info "SSN: #{ssn}"
    assert(ssn.size == 9, 'SSN should be 9 characters long.')
  end
end