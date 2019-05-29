require 'base_page'
require 'user_bar'

# Login (/) page
class LoginPage < BasePage
  # locators
  LOGIN_ID_BOX = { css: "input.gigya-input-text[name='username']" }.freeze
  LOGIN_ERROR = { css: ".gigya-error-msg[data-bound-to='loginID']" }.freeze

  PASSWORD_BOX = { css: "input.gigya-input-password[name='password']" }.freeze
  PASSWORD_ERROR = { css: ".gigya-error-msg[data-bound-to='password']" }.freeze

  LOGIN_BUTTON = { css: 'input.gigya-input-submit' }.freeze

  # TODO: Verify if this is present for all errors on this page
  STATUS_ALERT = { css: 'div.gigya-error-msg.gigya-form-error-msg' }.freeze
  FORGOT_PASSWORD = { css: "a.posh-forgot-password" }.freeze
  REMEMBER_ME = { css: "input.gigya-input-checkbox[name='remember']" }.freeze

  def initialize(driver)
    super(driver)
    wait_for { displayed?PASSWORD_BOX }
  end

  def valid_login(username, password)
    login_with username, password
    # TODO: verify this can be, or is, returned
    UserBar.new @driver
  end

  def error_login(username = 'tttttt', password = '999999')
    login_with username, password
    LoginErrorPage.new @driver
  end

  def no_entry_login
    click_on LOGIN_BUTTON
    # TODO: verify if this is returned or not
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
