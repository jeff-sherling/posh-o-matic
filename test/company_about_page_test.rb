$LOAD_PATH.push 'lib/page'
require_relative 'base_test'
require 'company_about_page'

# Test Company About page
class CompanyAboutPageTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @about = CompanyAboutPage.new @driver
  end

  def teardown
    @driver.quit
  end

  def test_page_title
    assert(@about.page_title.include?('About the Company'),
           'Page title should contain About the Company')
  end

  def test_h2_headings_are_present
    assert(@about.h2_header_count >= 5, 'Should be 5+ h2 headings.')
  end

  def test_h1_headings_are_present
    assert(@about.pampering_brand_present? && @about.founded_header_present?,
           'Pampering or Founded headers not present.')
  end

  def test_founders_row_elements_present
    assert(@about.founders_photo_present? &&
               @about.founders_row_content_present?,
           'Founders content and photo should be present.')
  end
end