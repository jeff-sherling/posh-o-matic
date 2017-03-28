require 'base_page'

# Privacy policy (/privacy-policy) page.
class PrivacyPolicyPage < BasePage
  PAGE_URL = '/privacy-policy'.freeze

  # Locator
  PAGE_HEADER = { css: 'h2.pane-title' }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit(PAGE_URL) if nav
    wait_for { displayed?(PAGE_HEADER) }
  end

  def page_header_text
    find(PAGE_HEADER).text
  end
end