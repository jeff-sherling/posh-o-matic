require 'base_page'

# Find a Consultant (/find) page
class FindConsultantPage < BasePage
  PAGE_URL = '/find'.freeze

  # Locators
  NAME_BOX = { id: 'name_value' }.freeze
  NAME_SUBMIT = { id: 'name_submit' }.freeze
  ZIP_CODE_BOX = { id: 'zip_value' }.freeze
  ZIP_CODE_SUBMIT = { id: 'zip_submit' }.freeze

  # SPONSOR_LOCATOR_ERROR = { css: '.consultant-locator-error' }.freeze
  LOCATOR_RESULTS = { css: '#render_view li[data-uid]' }.freeze # each result

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed?ZIP_CODE_SUBMIT }
  end

  def select_consultant
    # Enter name (Amanda Williams), wait for list, select one, redirects to
    # landing page; URL contains rep site name
  end

  def select_zip_code
    # Enter zip code (84101), wait for list, select one => redirects to landing
    # page; URL contains rep site name
  end
end