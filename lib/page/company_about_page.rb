require 'base_page'

class CompanyAboutPage < BasePage
  PAGE_URL = '/company-about'

  # locators
  PAGE_HEADER = { :css => '.row:not(.founded-row) .col-md-12' }
  FOUNDED_HEADER = { :css => '.founded-row h1.about-h1' }
  H1_HEADER = { :css => 'h1.about-h1' }
  H2_HEADER = { :css => 'h2' }

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

  def get_h2_count
    find_elements(H2_HEADER).size
  end

end