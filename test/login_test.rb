$:.push '../lib/page'
require 'login_page'
require_relative 'base_test'

class LoginTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @login_page = LoginPage.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_should_error_when_submit_empty_form
    @login_page.login_with
    assert(@login_page.login_box_error_present? &&
               @login_page.password_box_error_present?)
  end

  def test_should_error_when_submit_missing_username
    @login_page.login_with('', 'abc123')
    assert(@login_page.login_box_error_present?)
  end

  def test_should_error_when_submit_missing_password
    @login_page.login_with('Top Consultant', '')
    assert(@login_page.password_box_error_present?)
  end

  def test_should_error_when_submit_invalid_credentials
    @login_page.login_with('zzzzzzzzz999999999', 'abc123')
    assert(@login_page.error_alert_present?)
  end

  def test_should_land_on_home_page_with_valid_consultant
    @login_page.login_with('Top Consultant', '5%4N0thing')
  end

  def test_should_land_on_home_page_with_valid_customer
    @login_page.login_with('richard.the.lionheart@mailinator.com', 'abc123')
  end

end