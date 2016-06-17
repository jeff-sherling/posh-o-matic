$:.push '../lib/page'
require 'base_page'
require 'user_bar'

class UserRegister < BasePage
  PAGE_URL = '/user/register'

  # locators
  ERROR_ALERT = { :css => '.messages--error:not(empty)' }

  EMAIL_BOX = { :id => 'edit-mail' }
  EMAIL_BOX_ERROR = { :css => ".error[for='edit-mail']" }

  PASSWORD_BOX = { :id => 'edit-pass-pass1' }
  PASSWORD_BOX_ERROR = { :css => ".error[for='edit-pass-pass1']" }

  CONFIRM_PASSWORD_BOX = { :id => 'edit-pass-pass2' }
  CONFIRM_PASSWORD_BOX_ERROR = { :css => ".error[for='edit-pass-pass2']" }

  FIRST_NAME_BOX = { :id => 'edit-field-display-name-und-0-given' }
  LAST_NAME_BOX = { :id => 'edit-field-display-name-und-0-family' }
  BIRTH_YEAR_FIELD = { :id => 'edit-field-birthdate-und-0-value-year' }
  BIRTH_MONTH_FIELD = { :id => 'edit-field-birthdate-und-0-value-month' }
  BIRTH_DAY_FIELD = { :id => 'edit-field-birthdate-und-0-value-day' }
  GUARDIAN_FIRST_BOX = { :id => 'edit-field-guardian-name-und-0-given' }
  GUARDIAN_MIDDLE_BOX = { :id => 'edit-field-guardian-name-und-0-middle' }
  GUARDIAN_LAST_BOX = { :id => 'edit-field-guardian-name-und-0-family' }

  ACCEPT_CHECKBOX = { :id => 'edit-legal-accept' }
  ACCEPT_CHECKBOX_ERROR = { :css => ".error[for='legal_accept']" }

  CREATE_NEW_ACCOUNT_BTN = { :id => 'edit-submit' }

  def initialize(driver)
    super(driver)
    visit(PAGE_URL)
    wait_for { displayed?(CREATE_NEW_ACCOUNT_BTN) }
  end

  def create_valid_account(info = {})
    submit_customer info
    UserBar.new(driver)
  end

  def error_create_account(info = {})
    submit_customer(info)
  end

  def submit_form
    click_on CREATE_NEW_ACCOUNT_BTN
  end

  def is_email_error_present?
    wait_for(5) { displayed?(EMAIL_BOX_ERROR) }
  end

  def is_password_error_present?
    wait_for(5) { displayed?(PASSWORD_BOX_ERROR) }
  end

  def is_confirm_password_error_present?
    wait_for(5) { displayed?(CONFIRM_PASSWORD_BOX_ERROR) }
  end

  def is_accept_cbox_error_present?
    wait_for(5) { displayed?(ACCEPT_CHECKBOX_ERROR) }
  end

  def is_error_alert_present?
    wait_for(5) { displayed?(ERROR_ALERT) }
  end

  private

  def submit_customer(info = {})
    unless info.class == Hash
      raise 'Submit Customer method requires a Hash.'
    end
    if info.has_key?(:email)
      type EMAIL_BOX, info[:email]
    end
    if info.has_key?(:password)
      type PASSWORD_BOX, info[:password]
    end
    if info.has_key?(:confirm)
      type CONFIRM_PASSWORD_BOX, info[:confirm]
    end
    if info.has_key?(:first)
      type FIRST_NAME_BOX, info[:first]
    end
    if info.has_key?(:last)
      type LAST_NAME_BOX, info[:last]
    end
    if info.has_key?(:birth_year)
      select_dropdown BIRTH_YEAR_FIELD, info[:birth_year]
    end
    if info.has_key?(:birth_month)
      select_dropdown BIRTH_MONTH_FIELD, info[:birth_month]
    end
    if info.has_key?(:birth_day)
      select_dropdown BIRTH_DAY_FIELD, info[:birth_day]
    end
    if info.has_key?(:guardian_first)
      type GUARDIAN_FIRST_BOX, info[:guardian_first]
    end
    if info.has_key?(:guardian_middle)
      type GUARDIAN_MIDDLE_BOX, info[:guardian_middle]
    end
    if info.has_key?(:guardian_last)
      type GUARDIAN_LAST_BOX, info[:guardian_last]
    end
    if info.has_key?(:accept) && info[:accept] == true
      click_on ACCEPT_CHECKBOX
    end
    submit_form
  end

end