$LOAD_PATH.push 'lib/page'
$LOAD_PATH.push 'lib/data'
require_relative 'base_test'
require 'get_started_page'
require 'customer'

# Tests for /start page.
class GetStartedTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @get_started = GetStartedPage.new(@driver)
    @customer = Customer.new
  end

  def teardown
    @driver.quit
  end

  def test_success_with_valid_email
    assert(@get_started.submit_valid_email(@customer.email),
           'Success alert should be visible.')
  end

  def test_error_with_invalid_email
    assert(@get_started.submit_invalid_email(@customer.invalid_email),
           'Error message not present.')
  end

  def test_error_when_empty_submit
    assert(@get_started.submit_empty,
           'Label error on Email field should be present.')
  end
end