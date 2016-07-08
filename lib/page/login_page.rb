require 'base_page'
require 'user_bar'
require 'login_error_page'

class LoginPage < BasePage
  PAGE_URL = '/user?destination=vo'

  # locators
  LOGIN_ID_BOX = { :id => 'edit-name' }
  PASSWORD_BOX = { :id => 'edit-pass' }
  LOGIN_BUTTON = { :id => 'edit-submit' }

  STATUS_ALERT = { :css => '.messages--status' }

  CREATE_NEW_ACCOUNT = { :css => "a[href$='/user/register']" }
  REQUEST_NEW_PASSWORD = { :css => "a[href$='/user/password']" }

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed?(PASSWORD_BOX) }
  end

  def valid_login(username, password)
    login_with(username, password)
    UserBar.new(driver)
  end

  def error_login(username = '', password = '')
    login_with(username, password)
    LoginErrorPage.new(driver)
  end

  def status_alert_present?
    wait_for(5) { displayed?(STATUS_ALERT) }
  end

  private

  def login_with(username, password)
    unless username.empty?
      type LOGIN_ID_BOX, username
    end
    unless password.empty?
      type PASSWORD_BOX, password
    end
    click_on LOGIN_BUTTON
  end

end