require 'base_page'

# Cancellation and Refund Policies (/refund-policy) page.
class CancelRefundPoliciesPage < BasePage
  PAGE_URL = '/refund-policy'.freeze

  # Locators
  PAGE_HEADING = { css: 'h2.pane-title' }.freeze
  SUBHEADING = { css: 'strong' }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for(10) { displayed? PAGE_HEADING }
  end

  def header_content
    text_of PAGE_HEADING
  end

  def bold_subheading_count
    find_elements(SUBHEADING).size
  end
end