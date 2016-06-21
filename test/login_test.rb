$:.push '../lib/page'
require 'login_page'
require 'user_bar'
require_relative 'base_test'

class LoginTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @login_page = LoginPage.new(@driver)
    @user_bar = UserBar.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_error_with_empty_submit_form
    @login_page.error_login
    assert(@login_page.login_box_error_present? &&
               @login_page.password_box_error_present?)
  end

  def test_error_with_missing_username
    @login_page.error_login('', 'abc123')
    assert(@login_page.login_box_error_present?)
  end

  def test_error_with_missing_password
    @login_page.error_login('Top Consultant', '')
    assert(@login_page.password_box_error_present?)
  end

  def test_error_with_invalid_credentials
    @login_page.error_login('zzzzzzzzz999999999', 'abc123')
    assert(@login_page.error_alert_present?)
  end

  def test_consultant_can_login_and_logout
    @login_page.valid_login('Top Consultant', '5%4N0thing')
    assert(@user_bar.is_referral_link_present?, 'Unable to find Referral Link.')
    @user_bar.log_out
    assert(@user_bar.is_find_consultant_link_present?, 'User still logged in.')
  end

  def test_customer_can_login_and_logout
    @login_page.valid_login('richard.the.lionheart@mailinator.com', 'abc123')
    assert(@user_bar.is_referral_link_present?, 'Unable to find Referral Link.')
    @user_bar.log_out
    assert(@user_bar.is_find_consultant_link_present?, 'User still logged in.')
  end

end