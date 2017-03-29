require 'base_page'

# Step 2 (Posh Business) pane of Join Signup page
class JoinSignupStep2 < BasePage
  PAGE_URL = '/join/signup'.freeze

  # Locators
  EDIT_STEP_1_LINK = { css: '#step_info .fieldset-edit' }.freeze
  STARTER_KIT_LINK = { css: '.starter-kit-1.is-active > a' }.freeze

  # Sponsor appears when rep site is part of URL (e.g., /poshjesi/join/signup)
  REP_SPONSOR = { css: '#rep_sponsor' }.freeze

  # ...otherwise, applicant must choose consultant name or zip code
  SPONSOR_NAME_BOX = { id: 'name_value' }.freeze
  SPONSOR_NAME_SUBMIT = { id: 'name_submit' }.freeze
  SPONSOR_ZIP_CODE_BOX = { id: 'zip_value' }.freeze
  SPONSOR_ZIP_CODE_SUBMIT = { id: 'zip_submit' }.freeze

  SPONSOR_LOCATOR_ERROR = { css: '.consultant-locator-error' }.freeze
  LOCATOR_RESULTS = { css: '#render_view li[data-uid]' }.freeze # each result

  # If page reached anonymously, must choose consultant name or zip code
  REP_SITE_URL_BOX = { id: 'edit-rep-url' }.freeze
  REP_SITE_URL_ERROR = { css: '#edit-rep-url.error' }.freeze

  PROPAY_TERMS_CBOX = { id: 'edit-terms' }.freeze
  JOIN_POSH_BTN = { id: 'edit-business-submit' }.freeze

  def initialize(driver, info = {})
    @driver = driver
    @info = info
    wait_for(10) { displayed? JOIN_POSH_BTN }
  end

  def sponsor_name_present?
    displayed?(SPONSOR_NAME_BOX)
  end

  def sponsor_name_submit_present?
    displayed?(SPONSOR_NAME_SUBMIT)
  end

  def sponsor_zip_code_present?
    displayed?(SPONSOR_ZIP_CODE_BOX)
  end

  def sponsor_zip_submit_present?
    displayed?(SPONSOR_ZIP_CODE_SUBMIT)
  end

  def submit_valid
    populate_form(@info)
    click_on JOIN_POSH_BTN
    JoinSignupStep3.new(driver)
  end

  private

  def populate_form(info)
    raise 'Submit Customer method requires a Hash.' if info.class != Hash
    type FIRST_NAME_BOX, info[:first] if info.key?(:first)
  end
end