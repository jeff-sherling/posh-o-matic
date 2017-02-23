$:.push '../../lib/data'
require 'customer'
require 'minitest/autorun'
require 'minitest/reporters'
$:.push '../../lib/log'
require 'console'

class CustomerTest < Minitest::Test

  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new,
                            Minitest::Reporters::JUnitReporter.new]

  def setup
    @customer = Customer.new
  end

  def test_email
    email = @customer.get_email
    Console.log.info "Email: #{email}"
    assert(email.size == 1, "Hash should contain 1 element, but contains #{email.size}.")
  end

  def test_common
    common = @customer.get_common
    Console.log.info "Common: #{common}"
    assert(common.size == 4, "Hash should contain 4 elements, but contains #{common.size}.")
  end

  def test_customer
    customer = @customer.get_customer
    Console.log.info "Customer: #{customer}"
    assert(customer.size == 7, "Size should be 7, but is #{customer.size}.")
  end

  def test_mismatched_passwords
    mismatched = @customer.get_mismatched_passwords
    Console.log.info "Customer: #{mismatched}"
    assert(mismatched.size == 7, "Size should be 7, but is #{mismatched.size}.")
    assert(mismatched[:password] != mismatched[:confirm], 'Password and Confirm should  not match.')
  end

  def test_minor
    minor = @customer.get_minor
    Console.log.info "Customer: #{minor}"
    assert(minor.size == 10, "Size should be 10, but is #{minor.size}.")
  end

  def test_missing_guardian
    minor = @customer.get_missing_guardian
    Console.log.info "Customer: #{minor}"
    assert(minor.size == 9, "Size should be 9, but is #{minor.size}.")
  end

end