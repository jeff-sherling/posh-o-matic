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

  def test_should_error_when_submit_empty_form
    @login_page.error_login
    assert(@login_page.login_box_error_present? &&
               @login_page.password_box_error_present?)
  end

  def test_should_error_when_submit_missing_username
    @login_page.error_login('', 'abc123')
    assert(@login_page.login_box_error_present?)
  end

  def test_should_error_when_submit_missing_password
    @login_page.error_login('Top Consultant', '')
    assert(@login_page.password_box_error_present?)
  end

  def test_should_error_when_submit_invalid_credentials
    @login_page.error_login('zzzzzzzzz999999999', 'abc123')
    assert(@login_page.error_alert_present?)
  end

  def test_should_see_referral_link_with_valid_consultant
    @login_page.valid_login('Top Consultant', '5%4N0thing')
    assert(@user_bar.is_referral_link_present?, 'Unable to find Referral Link.')
  end

  def test_should_land_on_home_page_with_valid_customer
    @login_page.valid_login('richard.the.lionheart@mailinator.com', 'abc123')
    assert(@user_bar.is_referral_link_present?, 'Unable to find Referral Link.')
  end

end