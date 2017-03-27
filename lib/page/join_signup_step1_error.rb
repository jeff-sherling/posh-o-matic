require 'base_page'

# Join Signup (/join/signup) page.
class JoinSignupStep1Error < BasePage
  # Selector strings
  prefix = '#edit-account-fieldgroup-'

  first_name_error = "#{prefix}legal-name-first-name.error"
  last_name_error = "#{prefix}legal-name-last-name.error"
  date_of_birth_error = "#{prefix}birthdate-birthday-datepicker-popup-0.error"
  ssn_error = "#{prefix}ssn-ssn.error"
  address1_error = "#{prefix}address-address-line-1.error"
  city_error = "#{prefix}address-address-city.error"
  state_error = "#{prefix}address-address-state.error"
  zip_code_error = "#{prefix}address-address-zip.error"
  email_error = "#{prefix}email-mail.error"
  confirm_email_error = "[id^='#{prefix}email-mail-confirm'].error"
  confirm_email_message = '#field_account_mail_confirm .messages--error'
  password_error = "#{prefix}password-password-pass1.error"
  confirm_password_error = "[id^='#{prefix}password-password-pass'].error"
  phone_error = "#{prefix}phone-phone-number.error"

  # Locators
  ERROR = { css: '.error' }.freeze
  INPUT_ERROR = { css: 'input.error' }.freeze
  LABEL_ERROR = { css: 'label.error' }.freeze
  SELECT_ERROR = { css: 'select.error' }.freeze

  FIRST_NAME_ERROR = { css: first_name_error }.freeze
  LAST_NAME_ERROR = { css: last_name_error }.freeze
  DATE_OF_BIRTH_ERROR = { css: date_of_birth_error }.freeze
  SSN_ERROR = { css: ssn_error }.freeze
  ADDRESS1_ERROR = { css: address1_error }.freeze
  CITY_ERROR = { css: city_error }.freeze
  STATE_ERROR = { css: state_error }.freeze
  ZIP_CODE_ERROR = { css: zip_code_error }.freeze
  EMAIL_ERROR = { css: email_error }.freeze
  CONFIRM_EMAIL_ERROR = { css: confirm_email_error }.freeze
  CONFIRM_EMAIL_MESSAGE = { css: confirm_email_message }.freeze
  PASSWORD_ERROR = { css: password_error }.freeze
  CONFIRM_PASSWORD_ERROR = { css: confirm_password_error }.freeze
  PHONE_ERROR = { css: phone_error }.freeze

  TERMS_CONDITIONS_ERROR = { css: '#edit-account-terms.error' }.freeze

  def initialize(driver)
    @driver = driver
    wait_for(10) { displayed?(ERROR) }
  end

  def error_count
    find_elements(ERROR).size
  end

  def label_error_count
    find_elements(LABEL_ERROR).size
  end

  # First set of errors when submitting empty form
  def date_of_birth_error_present?
    wait_for(5) { displayed?(DATE_OF_BIRTH_ERROR) }
  end

  def ssn_error_present?
    wait_for(5) { displayed?(SSN_ERROR) }
  end

  def phone_error_present?
    wait_for(5) { displayed?(PHONE_ERROR) }
  end

  # Second set of errors when first set of boxes are populated
  def first_name_error_present?
    wait_for(5) { displayed?(FIRST_NAME_ERROR) }
  end

  def last_name_error_present?
    wait_for(5) { displayed?(LAST_NAME_ERROR) }
  end

  def email_error_present?
    wait_for(5) { displayed?(EMAIL_ERROR) }
  end

  def confirm_email_error_present?
    wait_for(5) { displayed?(CONFIRM_EMAIL_ERROR) }
  end

  def confirm_email_message_present?
    wait_for(5) { displayed?(CONFIRM_EMAIL_MESSAGE) }
  end

  def password_error_present?
    wait_for(5) { displayed?(PASSWORD_ERROR) }
  end

  def confirm_password_error_present?
    wait_for(5) { displayed?(CONFIRM_PASSWORD_ERROR) }
  end
end