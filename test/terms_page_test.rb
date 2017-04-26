$LOAD_PATH.push 'lib/page'
require_relative 'base_test'
require 'terms_page'

# Test Terms & Conditions page
class TermsPageTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @terms = TermsPage.new @driver
  end

  def teardown
    @driver.quit
  end

  def test_page_title
    assert(@terms.page_title.include?('Terms and Conditions'),
           'Page title contains Terms and Conditions.')
  end

  def test_page_heading
    assert_equal(@terms.page_heading.downcase, 'terms and conditions',
                 'Page heading should be Terms and Conditions')
  end

  def test_ordered_line_items
    assert_equal(@terms.ordered_line_items, 40,
                 'Should be 40 ordered line items')
  end
end