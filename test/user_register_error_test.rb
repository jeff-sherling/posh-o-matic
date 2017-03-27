$LOAD_PATH.push 'lib/page'
$LOAD_PATH.push 'lib/data'
require 'user_register_page'
require 'customer'
require_relative 'base_test'

# Test errors on User Register page.
class UserRegisterErrorTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @user_register = UserRegisterPage.new(@driver)
    @customer = Customer.new
  end

  def teardown
    @driver.quit
  end

  def test_errors_with_empty_form_submit
    error_page = @user_register.error_create_account
    assert(error_page.is_email_error_present? &&
        error_page.is_password_error_present? &&
        error_page.is_confirm_password_error_present? &&
        error_page.is_accept_cbox_error_present?,
           'One or more field errors are not present.')
  end

  def test_error_when_missing_name
    error_page = @user_register.error_create_account(@customer.common)
    assert(error_page.is_error_alert_present?, 'Error alert should be present.')
  end

  def test_error_when_missing_date
    error_page = @user_register.error_create_account(@customer.common)
    assert(error_page.is_error_alert_present?, 'Error alert should be present.')
  end

  def test_error_with_mismatched_passwords
    error_page = @user_register.error_create_account(
      @customer.mismatched_passwords
    )
    assert(error_page.is_error_alert_present?, 'Error alert should be present.')
  end

  def test_error_when_missing_guardian_name
    error_page = @user_register.error_create_account(
      @customer.missing_guardian
    )
    assert(error_page.is_error_alert_present?, 'Error alert should be present.')
  end
end