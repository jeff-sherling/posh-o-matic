$LOAD_PATH.push 'lib/page'
$LOAD_PATH.push 'lib/data'
require_relative 'base_test'
require 'join_signup_step1'
require 'join_signup_step1_error'
require 'consultant'

# Test for errors on Join Signup page.
class JoinSignupStep1ErrorTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @signup1 = JoinSignupStep1.new(@driver)
    @consultant = Consultant.new
  end

  def teardown
    @driver.quit
  end

  def test_submit_empty_form_errors
    error = @signup1.submit_error
    assert(error.ssn_error_present? &&
               error.date_of_birth_error_present? &&
               error.phone_error_present?,
           'SSN, Birth Date, and Phone field errors should be present.')
  end

  def test_submit_dob_ssn_phone_fields_errors
    consultant = @consultant.basic
    Console.log.info consultant
    error = @signup1.submit_error(consultant)
    assert(error.label_error_count == 11,
           'There should be 11 label errors (name, address, email/pw).')
  end

  def test_invalid_email_error
    consultant = @consultant.invalid_email
    Console.log.info consultant
    error = @signup1.phone_password_error consultant
    assert(error.email_error_present? && error.confirm_email_message_present?,
           'Both email fields should display error.')
  end

  def test_mismatched_email_error
    consultant = @consultant.mismatched_email
    Console.log.info consultant
    error = @signup1.phone_password_error consultant
    assert(error.confirm_email_message_present?,
           'Both email fields should display error.')
  end

  def test_mismatched_passwords_error
    skip "Bug 8037: mismatching passwords don't error out until last step"
    consultant = @consultant.mismatched_password
    Console.log.info consultant
    error = @signup1.submit_error consultant
    assert(error.password_error_present? &&
               error.confirm_password_error_present?,
           'Both password fields should display error.')
  end

  def test_phone_number_with_dashes_error
    basic = @consultant.valid_consultant
    basic[:phone] = '213-641-3985'
    error = @signup1.submit_error basic
    assert(error.phone_error_present?, 'Should be Phone Number field error.')
  end

  def test_ssn_with_dashes_error
    basic = @consultant.valid_consultant
    basic[:ssn] = '873-67-1425'
    error = @signup1.submit_error basic
    assert(error.ssn_error_present?, 'Should be SSN field error.')
  end
end