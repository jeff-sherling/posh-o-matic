$LOAD_PATH.push 'lib/page'
require 'new_password_page'
require 'login_page'
require_relative 'base_test'

# Test Request New Password page
class NewPasswordPageTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @new_password = NewPasswordPage.new@driver
  end

  def teardown
    @driver.quit
  end

  def test_error_when_submit_empty_field
    @new_password.error_request_password
    assert(@new_password.username_error_present?,
           'Username box error should be present.')
  end

  def test_error_when_submit_invalid_username
    @new_password.error_request_password('zzzzzzzzzzzzzz999999999999')
    assert(@new_password.error_alert_present?, 'Error alert should be present.')
  end

  def test_valid_request_new_password
    login = @new_password.request_new_password('23425@mailinator.com')
    assert(login.status_alert_present?, 'Status alert should be present.')
  end
end