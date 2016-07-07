$:.push '../../lib/data'
require 'consultant'
require 'minitest/autorun'
$:.push '../../lib/log'
require 'test_logger'

class ConsultantTest < Minitest::Test

  def test_get_common
    info = Consultant.get_common
    TestLogger.log.info "Info: #{info}"
    assert(info.size == 6, 'Hash should contain 6 elements')
  end

  def test_get_valid
    info = Consultant.get_valid_consultant
    TestLogger.log.info "Info: #{info}"
    assert(info.size == 15, 'Hash should contain 15 elements')
  end

  def test_get_mismatched_email
    info = Consultant.get_mismatched_email
    TestLogger.log.info "Info: #{info}"
    assert(info[:email] != info[:confirm_email], 'Email addresses should NOT match.')
  end

  def test_get_mismatched_password
    info = Consultant.get_mismatched_password
    TestLogger.log.info "Info: #{info}"
    assert(info[:password] != info[:confirm_password],
           'Passwords addresses should NOT match.')
  end

  def test_get_valid_minor
    info = Consultant.get_valid_minor_consultant
    TestLogger.log.info "Info: #{info}"
    assert(info.size == 15, 'Hash should contain 15 elements')
  end

end