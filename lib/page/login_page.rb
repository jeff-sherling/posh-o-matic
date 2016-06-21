$:.push '../lib/page'
require 'base_page'
require 'user_bar'

class LoginPage < BasePage
  PAGE_URL = '/user?destination=vo'

  # locators
  LOGIN_ID_BOX = { :id => 'edit-name' }
  PASSWORD_BOX = { :id => 'edit-pass' }
  LOGIN_BUTTON = { :id => 'edit-submit' }

  ERROR_ALERT = { :css => '.messages--error' }
  LOGIN_ID_ERROR = { :css => ".error[for='edit-name']" }
  PASSWORD_ERROR = { :css => ".error[for='edit-pass']" }

  CREATE_NEW_ACCOUNT = { :css => "a[href$='/user/register']" }
  REQUEST_NEW_PASSWORD = { :css => "a[href$='/user/password']" }

  def initialize(driver)
    super(driver)
    visit PAGE_URL
    wait_for { displayed?(PASSWORD_BOX) }
  end

  def valid_login(username, password)
    login_with(username, password)
    UserBar.new(driver)
  end

  def error_login(username = '', password = '')
    login_with(username, password)
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