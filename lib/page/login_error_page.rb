require 'base_page'

class LoginErrorPage < BasePage

  ERROR_ALERT = { :css => '.messages--error' }
  LOGIN_ID_ERROR = { :css => ".error[for='edit-name']" }
  PASSWORD_ERROR = { :css => ".error[for='edit-pass']" }
  ERROR = { :css => '.error' }

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