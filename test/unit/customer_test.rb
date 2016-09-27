$:.push '../../lib/data'
require 'customer'
require 'minitest/autorun'
$:.push '../../lib/log'
require 'console'

class CustomerTest < Minitest::Test

  def setup
    @random_customer = Customer.new
  end

  def test_email_only
    email = @random_customer.get_email_only
    Console.log.info "Email: #{email}"
    assert(email.size == 1, "Hash should contain 1 element, but contains #{email.size}.")
  end

  def test_email_password
    email = @random_customer.get_email_and_password
    Console.log.info "Email+Password: #{email}"
    assert(email.size == 4, "Hash should contain 4 elements, but contains #{email.size}.")
  end

  def test_missing_birthday
    missing = @random_customer.get_common
    Console.log.info "Missing: #{missing}"
    assert(missing.size == 6, "Size should be 6, but is #{missing.size}.")
  end

  def test_valid_customer
    valid_customer = @random_customer.get_valid_customer
    Console.log.info "Customer: #{valid_customer}"
    assert(valid_customer.size == 9, "Size should be 9, but is #{valid_customer.size}.")
  end

  def test_mismatched_passwords
    mismatched = @random_customer.get_mismatched_passwords
    Console.log.info "Customer: #{mismatched}"
    assert(mismatched.size == 9, "Size should be 9, but is #{mismatched.size}.")
    assert(mismatched[:password] != mismatched[:confirm], 'Password and Confirm should  not match.')
  end

  def test_valid_minor
    minor = @random_customer.get_valid_minor
    Console.log.info "Customer: #{minor}"
    assert(minor.size == 12, "Size should be 12, but is #{minor.size}.")
  end

  def test_missing_minor_guardian
    minor = @random_customer.get_missing_guardian
    Console.log.info "Customer: #{minor}"
    assert(minor.size == 11, "Size should be 11, but is #{minor.size}.")
  end

end