$:.push '../lib/page'
$:.push '../lib/data'
require_relative 'base_test'
require 'get_started_page'
require 'customer'

class GetStartedTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @get_started = GetStartedPage.new(@driver)
    @email = Customer.new
  end

  def teardown
    @driver.quit
  end

  def test_success_with_valid_email
    email = @email.get_email_only
    assert(@get_started.submit_valid_email(email), 'Success alert not visible.')
  end

  def test_error_with_invalid_email
    assert(@get_started.submit_invalid_email(@email.get_invalid_email), 'Error message not present.')
  end

end