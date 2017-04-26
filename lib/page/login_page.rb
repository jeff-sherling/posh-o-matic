require 'base_page'
require 'user_bar'
require 'login_error_page'

# Login (/user) page
class LoginPage < BasePage
  PAGE_URL = '/user'.freeze

  # locators
  LOGIN_ID_BOX = { id: 'edit-name' }.freeze
  PASSWORD_BOX = { id: 'edit-pass' }.freeze
  LOGIN_BUTTON = { id: 'edit-submit' }.freeze

  STATUS_ALERT = { css: '.messages--status' }.freeze

  CREATE_NEW_ACCOUNT = { css: "a[href$='/user/register']" }.freeze
  REQUEST_NEW_PASSWORD = { css: "a[href$='/user/password']" }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed?PASSWORD_BOX }
  end

  def valid_login(username, password)
    login_with username, password
    UserBar.new @driver
  end

  def error_login(username = '', password = '')
    login_with username, password
    LoginErrorPage.new @driver
  end

  def status_alert_present?
    wait_for(5) { displayed?STATUS_ALERT }
  end

  private

  def login_with(username, password)
    type LOGIN_ID_BOX, username unless username.empty?
    type PASSWORD_BOX, password unless password.empty?
    click_on LOGIN_BUTTON
  end
end