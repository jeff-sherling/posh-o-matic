$:.push '../lib/page'
require 'base_page'

class PrivacyPolicy < BasePage
  PAGE_URL = '/privacy-policy'

  # locators
  PAGE_HEADER = { :css => 'h2.pane-title' }
  SUB_HEADER = { :css => 'h3' }

  def initialize(driver)
    super(driver)
    visit(PAGE_URL)
    wait_for { displayed?(PAGE_HEADER) }
  end

  def get_page_header
    find(PAGE_HEADER).text
  end

end