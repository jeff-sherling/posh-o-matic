require 'base_page'
require 'login_page'

class NewPasswordPage < BasePage

  PAGE_URL = '/user/password'

  USERNAME_BOX = { :id => 'edit-name' }
  EMAIL_NEW_PASSWORD_BTN = { :id => 'edit-submit' }

  USERNAME_BOX_ERROR = { :css => ".error[for='edit-name']" }
  ERROR_ALERT = { :css => '.messages--error' }

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed?(EMAIL_NEW_PASSWORD_BTN) }
  end

  def request_new_password(username)
    submit_username(username)
    LoginPage.new(driver, false)
  end

  def error_request_password(username = '')
    submit_username(username)
  end

  def error_alert_present?
    wait_for(5) { displayed?(ERROR_ALERT) }
  end

  def username_error_present?
    wait_for(5) { displayed?(USERNAME_BOX_ERROR) }
  end

  private

  def submit_username(username)
    unless username.empty?
      type USERNAME_BOX, username
    end
    click_on EMAIL_NEW_PASSWORD_BTN
  end

end