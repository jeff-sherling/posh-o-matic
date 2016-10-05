require 'base_page'

class GetStartedPage < BasePage
  PAGE_URL = '/start'

  ERROR_ALERT = { :css => '.messages--error' }
  SUCCESS_ALERT = { :css => '.messages--status' }

  EMAIL_BOX = { :css => '#edit-mail' }
  EMAIL_BOX_ERROR = { :css => ".error[for='edit-mail']" }
  SIGN_UP = { :css => '#edit-submit' }

  def initialize(driver, nav = true)
    super(driver)
    visit(PAGE_URL) if nav
    wait_for { displayed?(EMAIL_BOX) }
  end

  def submit_valid_email(email)
    submit_email(email)
    is_success_present
  end

  def submit_invalid_email(email)
    submit_email(email)
    is_error_present
  end

  private

  def submit_email(email = {})
    if email.length > 0
      clear(EMAIL_BOX)
      type(EMAIL_BOX, email[:email])
    end
    click_on(SIGN_UP)
  end

  def is_error_present
    wait_for(5) { displayed?(ERROR_ALERT) }
  end

  def is_success_present
    wait_for(5) { displayed?(SUCCESS_ALERT) }
  end

end