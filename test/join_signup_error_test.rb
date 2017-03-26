$:.push '../lib/page'
$:.push '../lib/data'
require_relative 'base_test'
require 'join_signup_step1'
require 'join_signup_step1_error'
require 'consultant'

class JoinSignupErrorTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @signup1 = JoinSignupStep1.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_empty_form_errors
    error = @signup1.submit_error
    assert(error.ssn_error_present? &&
               error.date_of_birth_error_present? &&
               error.phone_error_present?, 'SSN, Birth Date, and Phone field errors should be present.')
  end

  def test_missing_address1_error
    consultant = Consultant.get_basic
    Console.log.info consultant
    error = @signup1.submit_error(consultant)
    assert(error.get_error_count > 10, 'There should be 10+ errors.')
  end

end