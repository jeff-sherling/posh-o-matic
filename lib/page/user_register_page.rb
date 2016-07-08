require 'base_page'
require 'user_bar'
require 'user_register_error'

class UserRegisterPage < BasePage
  PAGE_URL = '/user/register'

  # locators
  EMAIL_BOX = { :id => 'edit-mail' }
  PASSWORD_BOX = { :id => 'edit-pass-pass1' }
  CONFIRM_PASSWORD_BOX = { :id => 'edit-pass-pass2' }
  FIRST_NAME_BOX = { :id => 'edit-field-display-name-und-0-given' }
  LAST_NAME_BOX = { :id => 'edit-field-display-name-und-0-family' }
  BIRTH_YEAR_FIELD = { :id => 'edit-field-birthdate-und-0-value-year' }
  BIRTH_MONTH_FIELD = { :id => 'edit-field-birthdate-und-0-value-month' }
  BIRTH_DAY_FIELD = { :id => 'edit-field-birthdate-und-0-value-day' }
  GUARDIAN_FIRST_BOX = { :id => 'edit-field-guardian-name-und-0-given' }
  GUARDIAN_MIDDLE_BOX = { :id => 'edit-field-guardian-name-und-0-middle' }
  GUARDIAN_LAST_BOX = { :id => 'edit-field-guardian-name-und-0-family' }
  ACCEPT_CHECKBOX = { :id => 'edit-legal-accept' }
  CREATE_NEW_ACCOUNT_BTN = { :id => 'edit-submit' }

  def initialize(driver)
    super(driver)
    visit(PAGE_URL)
    wait_for { displayed?(CREATE_NEW_ACCOUNT_BTN) }
  end

  def create_valid_account(info)
    submit_customer info
    UserBar.new(driver)
  end

  def error_create_account(info = {})
    submit_customer(info)
    UserRegisterError.new(driver)
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
    click_on CREATE_NEW_ACCOUNT_BTN
  end

end