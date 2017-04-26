require 'base_page'
require 'user_register_error'
require 'landing_page'

# User Register (/user/register) page.
class UserRegisterPage < BasePage
  PAGE_URL = '/user/register'.freeze

  # locators
  EMAIL_BOX = { id: 'edit-mail' }.freeze
  PASSWORD_BOX = { id: 'edit-pass-pass1' }.freeze
  CONFIRM_PASSWORD_BOX = { id: 'edit-pass-pass2' }.freeze
  FIRST_NAME_BOX = { id: 'edit-field-display-name-und-0-given' }.freeze
  LAST_NAME_BOX = { id: 'edit-field-display-name-und-0-family' }.freeze
  BIRTH_YEAR_FIELD = { id: 'edit-field-birthdate-und-0-value-year' }.freeze
  BIRTH_MONTH_FIELD = { id: 'edit-field-birthdate-und-0-value-month' }.freeze
  BIRTH_DAY_FIELD = { id: 'edit-field-birthdate-und-0-value-day' }.freeze
  GUARDIAN_FIRST_BOX = { id: 'edit-field-guardian-name-und-0-given' }.freeze
  GUARDIAN_MIDDLE_BOX = { id: 'edit-field-guardian-name-und-0-middle' }.freeze
  GUARDIAN_LAST_BOX = { id: 'edit-field-guardian-name-und-0-family' }.freeze
  ACCEPT_CHECKBOX = { id: 'edit-legal-accept' }.freeze
  CREATE_NEW_ACCOUNT_BTN = { id: 'edit-submit' }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed?CREATE_NEW_ACCOUNT_BTN }
  end

  def create_valid_account(info)
    populate_customer info
    click_on CREATE_NEW_ACCOUNT_BTN
    LandingPage.new @driver, false
  end

  def error_create_account(info = {})
    populate_customer info unless info.empty?
    click_on CREATE_NEW_ACCOUNT_BTN
    UserRegisterError.new @driver
  end

  private

  def populate_customer(info)
    raise 'Submit Customer method requires a Hash.' unless info.class == Hash
    email_password_terms info
    first_last_name info
    birth_date info
    guardian info
  end

  def email_password_terms(info)
    type EMAIL_BOX, info[:email] if info.key?(:email)
    type PASSWORD_BOX, info[:password] if info.key?(:password)
    type CONFIRM_PASSWORD_BOX, info[:confirm] if info.key?(:confirm)
    click_on ACCEPT_CHECKBOX if info[:accept]
  end

  def first_last_name(info)
    type FIRST_NAME_BOX, info[:first] if info.key?(:first)
    type LAST_NAME_BOX, info[:last] if info.key?(:last)
  end

  def birth_date(info)
    select_dropdown BIRTH_YEAR_FIELD, info[:birth_year] if
        info.key?(:birth_year)
    select_dropdown BIRTH_MONTH_FIELD, info[:birth_month] if
        info.key?(:birth_month)
    select_dropdown BIRTH_DAY_FIELD, info[:birth_day] if
        info.key?(:birth_day)
  end

  def guardian(info)
    type GUARDIAN_FIRST_BOX, info[:guardian_first] if
        info.key?(:guardian_first)
    type GUARDIAN_MIDDLE_BOX, info[:guardian_middle] if
        info.key?(:guardian_last)
    type GUARDIAN_LAST_BOX, info[:guardian_last] if info.key?(:guardian_last)
  end
end