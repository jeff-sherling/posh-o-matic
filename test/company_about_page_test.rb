$:.push '../lib/page'
require_relative 'base_test'
require 'company_about_page'

class CompanyAboutPageTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @company_about = CompanyAboutPage.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_required_headers_are_present
    assert(@company_about.is_pampering_brand_present? &&
               @company_about.is_founded_header_present?, 'Pampering or Founded headers not present.')
  end

  def test_title_includes_about_the_company
    assert(@company_about.title.include?('About the Company'), 'Title should include About the Company.')
  end

end