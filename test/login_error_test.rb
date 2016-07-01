$:.push '../lib/page'
require 'login_page'
require_relative 'base_test'

class LoginErrorTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @login_page = LoginPage.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_error_with_empty_submit_form
    @login_page.error_login
    assert(@login_page.login_id_box_error_present? &&
               @login_page.password_box_error_present?)
  end

  def test_error_with_missing_username
    @login_page.error_login('', 'abc123')
    assert(@login_page.login_id_box_error_present?)
  end

  def test_error_with_missing_password
    @login_page.error_login('Top Consultant', '')
    assert(@login_page.password_box_error_present?)
  end

  def test_error_with_invalid_credentials
    @login_page.error_login('zzzzzzzzz999999999', 'abc123')
    assert(@login_page.error_alert_present?)
  end

end