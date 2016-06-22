$:.push '../lib/page'
require 'base_page'

class CompanyAboutPage < BasePage
  PAGE_URL = '/company-about'

  # locators
  PAGE_HEADER = { :css => 'h1.about-h1' }
  FOUNDED_HEADER = { :css => '.founded-row h1.about-h1' }

  def initialize(driver)
    super(driver)
    visit(PAGE_URL)
    wait_for { displayed?(PAGE_HEADER) }
  end

  # methods
  def is_pampering_brand_present?
    displayed?(PAGE_HEADER)
  end

  def is_founded_header_present?
    displayed?(FOUNDED_HEADER)
  end

end