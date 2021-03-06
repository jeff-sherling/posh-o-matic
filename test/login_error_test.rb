$LOAD_PATH.push 'lib/page'
require 'login_page'
require_relative 'base_test'

# Test Login page
class LoginErrorTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for BROWSER
    @login_page = LoginPage.new@driver
  end

  def teardown
    @driver.quit
  end

  def test_error_with_empty_submit_form
    Console.log.info "'test_error_with_empty_submit_form' results."
    login_error = @login_page.error_login
    assert(login_error.login_box_error_present? &&
               login_error.password_box_error_present?)
  end

  def test_error_with_missing_username
    Console.log.info "'test_error_with_missing_username' results."
    login_error = @login_page.error_login('', 'abc123')
    assert(login_error.login_box_error_present?)
  end

  def test_error_with_missing_password
    Console.log.info "'test_error_with_missing_password' results."
    login_error = @login_page.error_login('Top Consultant', '')
    assert(login_error.password_box_error_present?)
  end

  def test_error_with_invalid_credentials
    Console.log.info "'test_error_with_invalid_credentials' results."
    login_error = @login_page.error_login('zzzzzzzzz999999999', 'abc123')
    assert(login_error.error_alert_present?)
  end
end