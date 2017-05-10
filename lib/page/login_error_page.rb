require 'base_page'

# Errors appearing on the Login (/user) page
class LoginErrorPage < BasePage
  ERROR_ALERT = { css: '.messages--error' }.freeze
  LOGIN_ID_ERROR = { css: ".error[for='edit-name']" }.freeze
  PASSWORD_ERROR = { css: ".error[for='edit-pass']" }.freeze
  ERROR = { css: '.error,.messages--error' }.freeze

  def initialize(driver)
    @driver = driver
    wait_for { displayed?(ERROR) }
  end

  def error_alert_present?
    wait_for(5) { displayed?(ERROR_ALERT) }
  end

  def login_box_error_present?
    wait_for(5) { displayed?(LOGIN_ID_ERROR) }
  end

  def password_box_error_present?
    wait_for(5) { displayed?(PASSWORD_ERROR) }
  end
end