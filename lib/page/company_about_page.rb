require 'base_page'

# The Company About (/company-about) page.
class CompanyAboutPage < BasePage
  PAGE_URL = '/company-about'.freeze

  # locators
  PAGE_HEADER = { css: '.row:not(.founded-row) .col-md-12' }.freeze
  FOUNDED_HEADER = { css: '.founded-row h1.about-h1' }.freeze
  H1_HEADER = { css: 'h1.about-h1' }.freeze
  H2_HEADER = { css: 'h2' }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit(PAGE_URL) if nav
    wait_for { displayed?(PAGE_HEADER) }
  end

  def pampering_brand_present?
    displayed?(PAGE_HEADER)
  end

  def founded_header_present?
    displayed?(FOUNDED_HEADER)
  end

  def h2_header_count
    find_elements(H2_HEADER).size
  end
end