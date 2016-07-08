$:.push '../lib/page'
$:.push '../lib/data'
require 'user_register_page'
require 'customer'
require_relative 'base_test'

class UserRegisterPageTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @user_register = UserRegisterPage.new(@driver)
    @random_customer = Customer.new
  end

  def teardown
    @driver.quit
  end

  def test_create_valid_customer
    user_bar = @user_register.create_valid_account(@random_customer.get_valid_customer)
    assert(user_bar.is_referral_link_present?, 'Referral Link is not visible.')
  end

  def test_create_valid_minor_customer
    user_bar = @user_register.create_valid_account(@random_customer.get_valid_minor)
    assert(user_bar.is_referral_link_present?, 'Referral Link is not visible.')
  end

end