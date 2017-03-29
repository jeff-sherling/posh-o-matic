require 'base_page'

# User Register page (/user/register) errors.
class UserRegisterError < BasePage
  ERROR_ALERT = { css: '.messages--error:not(empty)' }.freeze
  EMAIL_BOX_ERROR = { css: ".error[for='edit-mail']" }.freeze
  PASSWORD_BOX_ERROR = { css: ".error[for='edit-pass-pass1']" }.freeze
  CONFIRM_PASSWORD_BOX_ERROR = { css: ".error[for='edit-pass-pass2']" }.freeze
  ACCEPT_CHECKBOX_ERROR = { css: ".error[for='legal_accept']" }.freeze
  ERROR = { css: '.error' }.freeze

  def initialize(driver)
    @driver = driver
    wait_for { displayed?ERROR }
  end

  def email_error_present?
    wait_for(5) { displayed?EMAIL_BOX_ERROR }
  end

  def password_error_present?
    wait_for(5) { displayed?PASSWORD_BOX_ERROR }
  end

  def confirm_password_error_present?
    wait_for(5) { displayed?CONFIRM_PASSWORD_BOX_ERROR }
  end

  def accept_cbox_error_present?
    wait_for(5) { displayed?ACCEPT_CHECKBOX_ERROR }
  end

  def error_alert_present?
    wait_for(5) { displayed?ERROR_ALERT }
  end
end