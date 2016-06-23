$:.push '../../lib/data'
require 'random_customer'
require 'minitest/autorun'

class RandomCustomerTest < Minitest::Test

  def setup
    @random_customer = RandomCustomer.new
  end

  def test_email_only_method
    email_only = @random_customer.get_email_only
    assert(email_only.size == 1, "Size should be 1, but is #{email_only.size}.")
  end

  def test_valid_customer_method
    valid_customer = @random_customer.get_valid_customer
    assert(valid_customer.size == 9, "Size should be 9, but is #{valid_customer.size}.")
  end

  def test_valid_minor_method
    minor = @random_customer.get_valid_minor
    assert(minor.size == 12, "Size should be 12, but is #{minor.size}.")
  end

  def test_missing_minor_guardian_method
    minor = @random_customer.get_missing_minor_guardian
    assert(minor.size == 11, "Size should be 11, but is #{minor.size}.")
  end

  def test_missing_birthday_method
    birth_date = @random_customer.get_missing_birth_date
    assert(birth_date.size == 6, "Size should be 6, but is #{birth_date.size}.")
  end

  def test_email_password_method
    email = @random_customer.get_email_and_password
    assert(email.size == 4, "Size should be 4, but is #{email.size}.")
  end
  
end