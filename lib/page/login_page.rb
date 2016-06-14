$:.push '../lib/page'
require 'base_page'

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
    visit(PAGE_URL)
    wait_for { displayed?(PASSWORD_BOX) }
  end

  def login_with(username = '', password = '')
    type LOGIN_ID_BOX, username
    type PASSWORD_BOX, password
    click_on LOGIN_BUTTON
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