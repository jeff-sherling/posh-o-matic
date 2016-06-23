$:.push '../lib/page'
require 'base_page'

class PrivacyPolicyPage < BasePage
  PAGE_URL = '/privacy-policy'

  # locator
  PAGE_HEADER = { :css => 'h2.pane-title' }

  def initialize(driver)
    super(driver)
    visit(PAGE_URL)
    wait_for { displayed?(PAGE_HEADER) }
  end

  def get_page_header_text
    find(PAGE_HEADER).text
  end

end