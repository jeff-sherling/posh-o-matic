require 'base_page'
require 'login_page'
require 'new_password_page'

class JoinSignup1Info < BasePage

  PAGE_URL = '/join/signup'

  # Edit Login locators
  SIGN_IN_HERE_LINK = { :css=> '#edit-account-step-login-label a[data-target]' }

  # User Login Modal - TODO: Create sign-in modal page object
  # SIGN_IN_MODAL = { :css => "#userLogin[aria-hidden='false']" }
  # CLOSE_BTN = { :css => '#userLogin button.close' }
  # FORGOT_PASSWORD_LINK = { :css => '#edit-forgot-password a' }

  # Edit Account locators
  FIRST_NAME_BOX = { :id => 'edit-account-fieldgroup-legal-name-first-name' }
  LAST_NAME_BOX = { :id => 'edit-account-fieldgroup-legal-name-last-name' }
  DATE_OF_BIRTH_BOX = { :css => 'edit-account-fieldgroup-birthdate-birthday-datepicker-popup-0' }
  # DATE SELECTOR
  SSN_BOX = { :css => 'edit-account-fieldgroup-ssn-ssn' }

  ADDRESS1_BOX = { :css => 'edit-account-fieldgroup-address-address-line-1' }
  ADDRESS2_BOX = { :css => 'edit-account-fieldgroup-address-address-line-2' }
  CITY_BOX = { :css => 'edit-account-fieldgroup-address-address-city' }
  STATE_BOX = { :css => 'edit-account-fieldgroup-address-address-state' }
  # STATE OPTIONS
  ZIP_CODE_BOX = { :id => 'edit-account-fieldgroup-address-address-zip' }

  EMAIL_BOX = { :id => 'edit-account-fieldgroup-email-mail' }
  CONFIRM_EMAIL_BOX = { :id => 'edit-account-fieldgroup-email-mail-confirm' }
  PASSWORD_BOX = { :id => 'edit-account-fieldgroup-password-password-pass1' }
  CONFIRM_PASSWORD_BOX = { :id => 'edit-account-fieldgroup-password-password-pass2' }
  PHONE_NUMBER_BOX = { :id => 'edit-account-fieldgroup-phone-phone-number' }
  TERMS_CONDITIONS_CBOX = { :id => 'edit-account-terms' }

  CONTINUE_BTN = { :id => 'edit-account-submit' }

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed?(CONFIRM_PASSWORD_BOX) }
  end

  def click_sign_in_here
    click_on SIGN_IN_HERE_LINK
  end

  def forgot_password
    click_on FORGOT_PASSWORD_LINK
    NewPasswordPage.new(driver)
  end

  def submit_valid(info)
    submit_form(info)
    JoinSignup2Sponsor.new(driver)
  end

  def submit_error(info = {})
    submit_form(info)
  end

  def signin_modal_present?
    wait_for(5) { displayed?(SIGN_IN_MODAL) }
  end

  private

  def submit_form(info)
    unless info.class == Hash
      raise 'Submit Customer method requires a Hash.'
    end
    if info.has_key?(:email)
      type EMAIL_BOX, info[:email]
    end
    if info.has_key?(:confirm_email)
      type CONFIRM_EMAIL_BOX, info[:confirm_email]
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
    click_on CONTINUE_BTN
  end

end