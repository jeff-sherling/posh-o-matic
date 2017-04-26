require 'base_page'

# Step 2 (Posh Business) pane of Join Signup page
class JoinSignupStep2 < BasePage
  # Locators
  STARTER_KIT_IMG = { css: '.starter-kit-1.is-active' }.freeze

  # Appears when rep site is part of URL (e.g., /poshjesi/join/signup)
  REP_SPONSOR = { css: 'div#rep_sponsor' }.freeze
  # ...otherwise, applicant must choose consultant name or zip code
  SPONSOR_NAME_BOX = { id: 'name_value' }.freeze
  SPONSOR_NAME_SUBMIT = { id: 'name_submit' }.freeze
  SPONSOR_ZIP_CODE_BOX = { id: 'zip_value' }.freeze
  SPONSOR_ZIP_CODE_SUBMIT = { id: 'zip_submit' }.freeze

  SPONSOR_LOCATOR_ERROR = { css: '.consultant-locator-error' }.freeze
  LOCATOR_RESULTS = { css: '#render_view li[data-uid]' }.freeze # each result
  REP_SITE_URL_BOX = { id: 'edit-rep-url' }.freeze
  REP_SITE_URL_ERROR = { css: '#edit-rep-url.error' }.freeze

  PROPAY_TERMS_CBOX = { id: 'edit-terms' }.freeze
  JOIN_POSH_BTN = { id: 'edit-business-submit' }.freeze

  def initialize(driver, info = {})
    @driver = driver
    @info = info
    wait_for(10) { displayed? JOIN_POSH_BTN }
  end

  def rep_sponsor_present?
    displayed? REP_SPONSOR
  end

  def sponsor_name_present?
    displayed?SPONSOR_NAME_BOX
  end

  def sponsor_name_submit_present?
    displayed?SPONSOR_NAME_SUBMIT
  end

  def sponsor_zip_code_present?
    displayed?SPONSOR_ZIP_CODE_BOX
  end

  def sponsor_zip_submit_present?
    displayed?SPONSOR_ZIP_CODE_SUBMIT
  end

  def starter_kit_present?
    displayed? STARTER_KIT_IMG
  end

  def submit_valid
    populate_form@info
    click_on JOIN_POSH_BTN
    JoinSignupStep3.new @driver
  end

  private

  def populate_form(info)
    raise 'Step 2 populate_form method requires a Hash.' if info.class != Hash
    type REP_SITE_URL_BOX, info[:rep_site] if info.key?(:rep_site)
    click_on PROPAY_TERMS_CBOX if info[:propay_terms]
  end
end