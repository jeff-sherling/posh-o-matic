require 'base_page'

class JoinSignup2Sponsor < BasePage

  # Locators
  EDIT_STEP_1_LINK = { :css => "#step_info .fieldset-edit[style*='block']" }

  BIRTH_MONTH_BOX = { :id => 'edit-birthday-month' }
  BIRTH_DAY_BOX = { :id => 'edit-birthday-day' }
  BIRTH_YEAR_BOX = { :id => 'edit-birthday-year' }
  BIRTH_DATE_ERROR = { :css => '.birthday-error-wrapper' }

  # Appear when signing up without pre-selected sponsor; e.g., /p/join/signup
  SPONSOR_NAME_BOX = { :id => 'name_value' }
  SPONSOR_NAME_SUBMIT = { :id => 'name_submit' }
  SPONSOR_ZIP_CODE_BOX = { :id => 'zip_value' }
  SPONSOR_ZIP_CODE_SUBMIT = { :id => 'zip_submit' }
  SPONSOR_LOCATOR_ERROR = { :css => '.consultant-locator-error' }

  # Appears when navigating to sign up from rep site, such as /poshjesi/join/signup
  REP_SPONSOR = { :css => '#rep_sponsor .consultant-locator-name' }
  LOCATOR_RESULTS = { :css => '#render_view li[data-uid]' } # each result

  REP_SITE_URL_BOX = { :id => 'edit-rep-url' }
  REP_SITE_URL_ERROR = { :css => "label.error[for='edit-rep-url']" }

  CONTINUE_BTN = { :id => 'edit-sponsor-submit' }

  def initialize(driver)
    @driver = driver
    wait_for(10) { displayed?(CONTINUE_BTN) }
  end

end