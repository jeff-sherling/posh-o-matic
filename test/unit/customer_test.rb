$LOAD_PATH.push 'lib/data'
$LOAD_PATH.push 'lib/log'
require 'minitest/autorun'
require 'minitest/reporters'
require 'customer'
require 'console'

# Customer unit test.
class CustomerTest < Minitest::Test
  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new,
                            Minitest::Reporters::JUnitReporter.new]

  def setup
    @customer = Customer.new
  end

  def test_email
    email = @customer.email
    Console.log.info "Email: #{email}"
    assert(email.size == 1, "Hash should contain 1 element, but contains
      #{email.size}.")
  end

  def test_common
    common = @customer.common
    Console.log.info "Common: #{common}"
    assert(common.size == 4, "Hash should contain 4 elements, but contains
      #{common.size}.")
  end

  def test_customer
    customer = @customer.customer
    Console.log.info "Customer: #{customer}"
    assert(customer.size == 9, "Size should be 9, but is #{customer.size}.")
  end

  def test_mismatched_passwords
    mismatched = @customer.mismatched_passwords
    Console.log.info "Mismatched passwords: #{mismatched}"
    assert(mismatched.size == 9, "Size should be 9, but is #{mismatched.size}.")
    assert(mismatched[:password] != mismatched[:confirm],
           'Password and Confirm should not match.')
  end

  def test_minor
    minor = @customer.minor
    Console.log.info "Minor: #{minor}"
    assert(minor.size == 12, "Size should be 12, but is #{minor.size}.")
  end

  def test_missing_guardian
    minor = @customer.missing_guardian
    Console.log.info "Missing Guardian: #{minor}"
    assert(minor.size == 11, "Size should be 11, but is #{minor.size}.")
  end
end