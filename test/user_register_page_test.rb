$LOAD_PATH.push 'lib/page'
$LOAD_PATH.push 'lib/data'
$LOAD_PATH.push 'lib/log'
require 'user_register_page'
require 'customer'
require_relative 'base_test'

# Test User Register page.
class UserRegisterPageTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for BROWSER
    @register = UserRegisterPage.new(@driver)
    @customer = Customer.new
  end

  def teardown
    @driver.quit
  end

  def test_create_valid_customer
    landing = @register.create_valid_account(@customer.customer)
    assert(landing.success_alert_present?, 'Success alert not present.')
  end

  def test_create_valid_minor_customer
    landing = @register.create_valid_account(@customer.minor)
    assert(landing.success_alert_present?, 'Success alert not present.')
  end
end