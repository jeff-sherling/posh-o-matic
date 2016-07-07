$:.push '../../lib/data'
require 'user_factory'
require 'minitest/autorun'
$:.push '../../lib/log'
require 'test_logger'

class UserFactoryTest < Minitest::Test

  def test_name
    name = UserFactory.get_name 12
    TestLogger.log.info "Name: #{name}"
    assert(name.size == 12, 'First name should be 12 characters.')
  end

  def test_name_argument_value
    assert_raises(RuntimeError, 'Fixnum should be > 0.') {UserFactory.get_name 0}
  end

  def test_name_argument_fixnum
    assert_raises(RuntimeError, 'Argument should be a Fixnum.') {UserFactory.get_name 'a'}
  end

  def test_initial
    initial = UserFactory.get_name 1
    TestLogger.log.info "Initial: #{initial}"
    assert(initial.size == 1, 'Initial should only be 1 character.')
  end

  def test_email
    email = UserFactory.get_email
    TestLogger.log.info "Email: #{email}"
    assert(email.size == 41, 'Email size is less than 5.')
  end

  def test_birth_year
    year = UserFactory.get_birth_year
    TestLogger.log.info "Year: #{year}"
    assert(year.size == 4, 'Year should be 4 digits.')
  end

  def test_minor_birth_year
    year = UserFactory.get_minor_birth_year
    TestLogger.log.info "Minor Year: #{year}"
    assert(year == "#{Time.new.year - 15}", 'Should be current year - 15.')
  end

  def test_birth_month
    month = UserFactory.get_birth_month
    TestLogger.log.info "Month: #{month}"
    assert(month.size >= 1 && month.size < 3, 'Month should be 1-2 digits.')
  end

  def test_birth_day
    day = UserFactory.get_birth_day
    TestLogger.log.info "Day: #{day}"
    assert(day.size >= 1 && day.size < 3, 'Day should be 1-2 digits.')
  end

  def test_sponsor_zip
    zip = UserFactory.get_zip_code
    TestLogger.log.info "Zip: #{zip}"
    assert(zip.size == 5, 'Zip code is not padded with leading zeros.')
  end

end