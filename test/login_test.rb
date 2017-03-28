$LOAD_PATH.push 'lib/page'
require 'login_page'
require_relative 'base_test'

# Test Login page.
class LoginTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @login_page = LoginPage.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_consultant_can_login_and_logout
    user_bar = @login_page.valid_login('TopConsultant', '5%4N0thing')
    assert(user_bar.referral_link_present?, 'Unable to find Referral Link.')
    user_bar.log_out
    assert(user_bar.find_consultant_link_present?, 'User still logged in.')
  end

  def test_customer_can_login_and_logout
    user_bar = @login_page.valid_login('richard.the.lionheart@mailinator.com',
                                       'abc123')
    assert(user_bar.referral_link_present?, 'Unable to find Referral Link.')
    user_bar.log_out
    assert(user_bar.find_consultant_link_present?, 'User still logged in.')
  end
end