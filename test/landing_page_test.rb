$LOAD_PATH.push 'lib/page'
require_relative 'base_test'
require 'landing_page'
require 'login_page'

# Test Landing (/) page
class LandingPageTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
  end

  def teardown
    @driver.quit
  end

  def test_public_page_class_when_anonymous
    landing = LandingPage.new @driver
    assert(landing.public_page?, 'Body tag class should be not-logged-in.')
  end

  def test_logged_in_class_for_logged_in_user
    LoginPage.new(@driver).valid_login('TopConsultant', '5%4N0thing')
    landing = LandingPage.new@driver
    assert(landing.logged_in?, '')
  end
end