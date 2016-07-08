require 'base_page'

class UserRegisterError < BasePage

  ERROR_ALERT = { :css => '.messages--error:not(empty)' }
  EMAIL_BOX_ERROR = { :css => ".error[for='edit-mail']" }
  PASSWORD_BOX_ERROR = { :css => ".error[for='edit-pass-pass1']" }
  CONFIRM_PASSWORD_BOX_ERROR = { :css => ".error[for='edit-pass-pass2']" }
  ACCEPT_CHECKBOX_ERROR = { :css => ".error[for='legal_accept']" }

  ERROR = { :css => '.error' }

  def initialize(driver)
    @driver = driver
    wait_for { displayed?(ERROR) }
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

end