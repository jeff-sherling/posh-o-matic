require 'base_page'

# Get Started (/start) page.
class GetStartedPage < BasePage
  PAGE_URL = '/start'.freeze

  ERROR_ALERT = { css: '.messages--error' }.freeze
  SUCCESS_ALERT = { css: '.messages--status' }.freeze

  EMAIL_BOX = { id: 'edit-mail' }.freeze
  EMAIL_BOX_ERROR = { css: ".error[for='edit-mail']" }.freeze
  SIGN_UP = { id: 'edit-submit' }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed?EMAIL_BOX }
  end

  def submit_valid_email(email)
    submit_email(email)
    success_present?
  end

  def submit_invalid_email(email)
    submit_email(email)
    error_present?
  end

  def email_box_present?
    wait_for(5) { displayed? EMAIL_BOX }
  end

  private

  def submit_email(email = {})
    raise ArgumentError 'Hash requires email.' if email.class != Hash ||
                                                  email.empty?
    clear(EMAIL_BOX)
    type(EMAIL_BOX, email[:email])
    click_on(SIGN_UP)
  end

  def error_present?
    wait_for(5) { displayed?(ERROR_ALERT) }
  end

  def success_present?
    wait_for(5) { displayed?(SUCCESS_ALERT) }
  end
end