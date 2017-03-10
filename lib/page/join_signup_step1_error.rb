require 'base_page'

class JoinSignup1Error < BasePage

  # Locators
  ERROR = { :css => '.error' }
  ERROR_LABEL = { :css => 'label.error' }

  FIRST_NAME_ERROR = { :css => '#edit-account-fieldgroup-legal-name-first-name.error' }
  LAST_NAME_ERROR = { :css => '#edit-account-fieldgroup-legal-name-last-name.error' }
  DATE_OF_BIRTH_ERROR = { :css => '#edit-account-fieldgroup-birthdate-birthday-datepicker-popup-0.error' }
  SSN_ERROR = { :css => '#edit-account-fieldgroup-ssn-ssn.error' }

  ADDRESS1_ERROR = { :css => '#edit-account-fieldgroup-address-address-line-1.error' }
  CITY_ERROR = { :css => '#edit-account-fieldgroup-address-address-city.error' }
  STATE_ERROR = { :css => '#edit-account-fieldgroup-address-address-state.error' }
  ZIP_CODE_ERROR = { :css => '#edit-account-fieldgroup-address-address-zip.error' }

  EMAIL_ERROR = { :css => '#edit-account-fieldgroup-email-mail.error' }
  CONFIRM_EMAIL_ERROR = { :css => '#edit-account-fieldgroup-email-mail-confirm.error' }
  PASSWORD_ERROR = { :css => '#edit-account-fieldgroup-password-password-pass1.error' }
  CONFIRM_PASSWORD_ERROR = { :css => '#edit-account-fieldgroup-password-password-pass2.error' }
  PHONE_ERROR = { :css => '#edit-account-fieldgroup-phone-phone-number.error'}

  TERMS_CONDITIONS_ERROR = { :css => '#edit-account-terms.error' }

  def initialize(driver)
    @driver = driver
    wait_for(10) { displayed?(ERROR) }
  end

  def get_error_count
    find_elements(ERROR).size
  end

  def get_error_label_count
    find_elements(ERROR_LABEL).size
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

  # Second set of errors when previous set of boxes populated
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

  def password_error_present?
    wait_for(5) { displayed?(PASSWORD_ERROR) }
  end

  def confirm_password_error_present?
    wait_for(5) { displayed?(CONFIRM_PASSWORD_ERROR) }
  end

end