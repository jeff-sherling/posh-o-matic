require 'base_page'

# Careers (/careers) page.
class CareersPage < BasePage
  PAGE_URL = '/careers'.freeze

  # Locators
  INTERESTED_JOINING_TEAM = { css: 'h2.pane-title' }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit(PAGE_URL) if nav
    wait_for { displayed?(INTERESTED_JOINING_TEAM) }
  end
end