require 'base_page'
require 'login_page'
require 'new_password_page'

class JoinSignup1Info < BasePage

  PAGE_URL = '/join/signup'

  # Edit Login locators
  SIGN_IN_HERE_BTN = { :css=> '#edit-step-login-button .btn' }
  FORGOT_PASSWORD_LINK = { :css => '#edit-forgot-password a' }

  # Edit Account locators
  FIRST_NAME_BOX = { :id => 'edit-account-first-name' }
  LAST_NAME_BOX = { :id => 'edit-account-last-name' }
  EMAIL_BOX = { :id => 'edit-account-mail' }
  CONFIRM_EMAIL_BOX = { :id => 'edit-account-mail-confirm' }
  PASSWORD_BOX = { :id => 'edit-account-password-pass1' }
  CONFIRM_PASSWORD_BOX = { :id => 'edit-account-password-pass2' }

  CONTINUE_BTN = { :id => 'edit-account-submit' }

  LOGIN_MODAL = { :css => '#userLogin .modal-dialog' }

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed?(CONFIRM_PASSWORD_BOX) }
  end

  def click_sign_in_here
    click_on SIGN_IN_HERE_BTN
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

  def modal_present?
    wait_for(5) { displayed?(LOGIN_MODAL) }
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