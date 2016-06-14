$:.push '../lib/page'
require 'company_about'
require_relative 'base_test'

class CompanyAboutTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @company_about = CompanyAbout.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_pampering_brand_header_is_present
    assert(@company_about.is_pampering_brand_present?, 'Pampering header not present.')
  end

  def test_founded_header_is_present
    assert(@company_about.is_founded_header_present?, 'Founded header not present.')
  end

end