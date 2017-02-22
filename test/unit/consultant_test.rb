$:.push '../../lib/data'
require 'consultant'
require 'minitest/autorun'
require 'minitest/reporters'
$:.push '../../lib/log'
require 'console'

class ConsultantTest < Minitest::Test

  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new,
                            Minitest::Reporters::JUnitReporter.new]

  def test_get_basic
    info = Consultant.get_basic
    Console.log.info "Info: #{info}"
    assert(info.size == 5, 'Hash should contain 5 elements')
  end

  def test_get_common
    info = Consultant.get_common
    Console.log.info "Info: #{info}"
    assert(info.size == 11, 'Hash should contain 11 elements')
  end

  def test_get_address
    info = Consultant.get_address
    Console.log.info "Info: #{info}"
    assert(info.size == 17, 'Hash should contain 17 elements')
  end

  def test_get_valid
    info = Consultant.get_valid_consultant
    Console.log.info "Info: #{info}"
    assert(info.size == 21, 'Hash should contain 21 elements')
  end

  def test_get_mismatched_email
    info = Consultant.get_mismatched_email
    Console.log.info "Info: #{info}"
    assert(info[:email] != info[:confirm_email], 'Email addresses should NOT match.')
  end

  def test_get_mismatched_password
    info = Consultant.get_mismatched_password
    Console.log.info "Info: #{info}"
    assert(info[:password] != info[:confirm_password],
           'Passwords addresses should NOT match.')
  end

  def test_get_minor
    info = Consultant.get_minor_consultant
    Console.log.info "Info: #{info}"
    assert(info.size == 21, 'Birth year should be 15 years ago.')
  end

end