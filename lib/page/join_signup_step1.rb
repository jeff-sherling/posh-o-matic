require 'base_page'
require 'join_signup_step1_error'
require 'join_signup_step2'

# First (default) panel of /join/signup page.
class JoinSignupStep1 < BasePage
  PAGE_URL = '/join/signup'.freeze

  # Selector strings
  prefix = 'edit-account-fieldgroup-'
  first_name = "#{prefix}legal-name-first-name"
  date_of_birth = "#{prefix}birthdate-birthday-datepicker-popup-0"
  confirm_email = "#{prefix}email-mail-confirm"
  password = "#{prefix}password-password-pass1"
  confirm_password = "#{prefix}password-password-pass2"

  # Locators
  FIRST_NAME_BOX = { id: first_name }.freeze
  LAST_NAME_BOX = { id: 'edit-account-fieldgroup-legal-name-last-name' }.freeze
  DATE_OF_BIRTH_BOX = { id: date_of_birth }.freeze
  SSN_BOX = { id: 'edit-account-fieldgroup-ssn-ssn' }.freeze
  ADDRESS1_BOX = { id: 'edit-account-fieldgroup-address-address-line-1' }.freeze
  ADDRESS2_BOX = { id: 'edit-account-fieldgroup-address-address-line-2' }.freeze
  CITY_BOX = { id: 'edit-account-fieldgroup-address-address-city' }.freeze
  STATE_BOX = { id: 'edit-account-fieldgroup-address-address-state' }.freeze
  ZIP_CODE_BOX = { id: 'edit-account-fieldgroup-address-address-zip' }.freeze
  EMAIL_BOX = { id: 'edit-account-fieldgroup-email-mail' }.freeze
  CONFIRM_EMAIL_BOX = { id: confirm_email }.freeze
  PASSWORD_BOX = { id: password }.freeze
  PASSWORD_STRENGTH = { css: '.password-strength-text' }.freeze
  CONFIRM_PASSWORD_BOX = { id: confirm_password }.freeze
  PASSWORDS_MATCH_YES = { css: '.password-confirm > span.ok' }.freeze
  PASSWORDS_MATCH_NO = { css: '.password-confirm > span.error' }.freeze
  PHONE_NUMBER_BOX = { id: 'edit-account-fieldgroup-phone-phone-number' }.freeze
  TERMS_CONDITIONS_CBOX = { id: 'edit-account-terms' }.freeze
  CONTINUE_BTN = { id: 'edit-account-submit' }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed? CONFIRM_PASSWORD_BOX }
  end

  def submit_valid(info)
    populate_form(info)
    click_on CONTINUE_BTN
    JoinSignupStep2.new(driver)
  end

  def submit_error(info = {})
    populate_form(info) unless info.empty?
    click_on CONTINUE_BTN
    JoinSignupStep1Error.new(@driver)
  end

  def phone_password_error(info = {})
    populate_email_password info unless info.empty?
    click_on TERMS_CONDITIONS_CBOX
    JoinSignupStep1Error.new@driver
  end

  def get_password_strength(info = { password: 'abc' })
    populate_form info
    text_of PASSWORD_STRENGTH
  end

  def passwords_match?(info)
    populate_form(info)
    if displayed? PASSWORDS_MATCH_YES
      true
    elsif displayed? PASSWORDS_MATCH_NO
      false
    else
      false
    end
  end

  def signin_modal_present?
    wait_for(5) { displayed?(SIGN_IN_MODAL) }
  end

  private

  def populate_form(info)
    raise 'Submit Customer method requires a Hash.' if info.class != Hash
    select_dropdown STATE_BOX, info[:state] if info.key?(:state)
    populate_name_ssn info
    populate_address info
    populate_email_password info
    populate_phone_birth_term info
  end

  def populate_name_ssn(info)
    type FIRST_NAME_BOX, info[:first] if info.key?(:first)
    type LAST_NAME_BOX, info[:last] if info.key?(:last)
    type SSN_BOX, info[:ssn] if info.key?(:ssn)
  end

  def populate_address(info)
    type ADDRESS1_BOX, info[:address1] if info.key?(:address1)
    type ADDRESS2_BOX, info[:address2] if info.key?(:address2)
    type CITY_BOX, info[:city] if info.key?(:city)
    type ZIP_CODE_BOX, info[:zip] if info.key?(:zip)
  end

  def populate_email_password(info)
    type EMAIL_BOX, info[:email] if info.key?(:email)
    type PASSWORD_BOX, info[:password] if info.key?(:password)
    type CONFIRM_EMAIL_BOX, info[:confirm_email] if info.key?(:confirm_email)
    type CONFIRM_PASSWORD_BOX, info[:confirm_password] if
        info.key?(:confirm_password)
  end

  def populate_phone_birth_term(info)
    type DATE_OF_BIRTH_BOX, info[:birth_date] if info.key?(:birth_date)
    click_on TERMS_CONDITIONS_CBOX if info[:terms]
    type PHONE_NUMBER_BOX, info[:phone] if info.key?(:phone)
  end
end