$LOAD_PATH.push 'lib/data'
$LOAD_PATH.push 'lib/log'
require 'consultant'
require 'minitest/autorun'
require 'minitest/reporters'
require 'console'

# Consultant unit test.
class ConsultantTest < Minitest::Test
  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new,
                            Minitest::Reporters::JUnitReporter.new]

  def setup
    @consultant = Consultant.new
  end

  def test_basic
    info = @consultant.basic
    Console.log.info "Info: #{info}"
    assert(info.size == 3, 'Hash should contain 3 elements')
  end

  def test_common
    info = @consultant.common
    Console.log.info "Info: #{info}"
    assert(info.size == 9, 'Hash should contain 9 elements')
  end

  def test_address
    info = @consultant.address
    Console.log.info "Info: #{info}"
    assert(info.size == 15, 'Hash should contain 15 elements')
  end

  def test_valid_consultant
    info = @consultant.valid_consultant
    Console.log.info "Info: #{info}"
    assert(info.size == 19, 'Hash should contain 19 elements')
  end

  def test_mismatched_email
    info = @consultant.mismatched_email
    Console.log.info "Info: #{info}"
    assert(info[:email] != info[:confirm_email],
           'Email addresses should NOT match.')
  end

  def test_mismatched_password
    info = @consultant.mismatched_password
    Console.log.info "Info: #{info}"
    assert(info[:password] != info[:confirm_password],
           'Passwords addresses should NOT match.')
  end

  def test_minor
    info = @consultant.minor_consultant
    Console.log.info "Info: #{info}"
    assert(info.size == 19, 'Minor hash should contain 19 elements.')
  end
end