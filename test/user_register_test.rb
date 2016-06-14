$:.push '../lib/page'
$:.push '../lib/data'
require 'user_register'
require 'random_customer'
require_relative 'base_test'

class UserRegisterTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @user_register = UserRegister.new(@driver)
    @random_customer = RandomCustomer.new
  end

  def teardown
    @driver.quit
  end

  def test_field_errors_with_empty_form_submit
    @user_register.submit_form
    assert(@user_register.is_email_error_present? &&
          @user_register.is_password_error_present? &&
          @user_register.is_confirm_password_error_present? &&
          @user_register.is_accept_cbox_error_present?,
           'Field error highlights are not present.')
  end

  def test_error_alert_with_missing_name
    @user_register.submit_customer(@random_customer.get_email_and_password)
    assert(@user_register.is_error_alert_present?, 'Error alert is not present.')
  end

  def test_error_alert_with_missing_date
    @user_register.submit_customer(@random_customer.get_missing_birth_date)
    assert(@user_register.is_error_alert_present?, 'Error alert is not present.')
  end

  def test_error_alert_with_mismatched_passwords
    @user_register.submit_customer(@random_customer.get_mismatched_passwords)
    assert(@user_register.is_error_alert_present?, 'Error alert is not present.')
  end

  def test_submit_valid_customer
    @user_register.submit_customer(@random_customer.get_valid_customer)
    # TODO: New page
  end

  def test_create_minor_customer
    @user_register.submit_customer(@random_customer.get_valid_minor)
    # TODO: New page
  end

end