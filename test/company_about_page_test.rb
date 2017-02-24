$:.push '../lib/page'
require_relative 'base_test'
require 'company_about_page'

class CompanyAboutPageTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @about_page = CompanyAboutPage.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_required_h1_headings_are_present
    assert(@about_page.is_pampering_brand_present? && @about_page.is_founded_header_present?,
           'Pampering or Founded headers not present.')
  end

  def test_title_includes_about_the_company
    assert(@about_page.get_title.include?('About the Company'),
           'Title should include About the Company.')
  end

  def test_h2_headings_are_present
    assert(@about_page.get_h2_count >= 5, 'Should be 5+ h2 headings.')
  end

end