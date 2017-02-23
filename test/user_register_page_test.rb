$:.push '../lib/page'
$:.push '../lib/data'
require 'user_register_page'
require 'customer'
require_relative 'base_test'

class UserRegisterPageTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @register = UserRegisterPage.new(@driver)
    @customer = Customer.new
  end

  def teardown
    @driver.quit
  end

  def test_create_valid_customer
    @register.create_valid_account(@customer.get_customer)
    assert(@register.success_alert_present?, 'Success alert not present.')
  end

  def test_create_valid_minor_customer
    @register.create_valid_account(@customer.get_minor)
    assert(@register.success_alert_present?, 'Success alert not present.')
  end

end