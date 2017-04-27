$LOAD_PATH.push 'lib/page'
require 'cancel_refund_policies_page'
require_relative 'base_test'

# Test Cancellation and Refund Policies page
class CancelRefundPoliciesPageTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @cancel = CancelRefundPoliciesPage.new @driver
  end

  def teardown
    @driver.quit
  end

  def test_page_title
    assert(@cancel.page_title.include?('Refund Policy'),
           'Should contain Refund Policy.')
  end

  def test_header_content
    assert_equal(@cancel.header_content.downcase,
                 'cancellation and refund policies',
                 'Header should be Cancellation and Refund Policies.')
  end

  def test_subheadings_count
    assert_equal(@cancel.bold_subheading_count, 3,
                 'Should be 3 subheadings.')
  end

  def test_paragraph_count
    assert(@cancel.paragraph_count > 17, 'Should be 18 paragraphs.')
  end

  def test_share_social_icons_present
    assert(@cancel.facebook_icon_present? &&
               @cancel.pinterest_icon_present? &&
               @cancel.twitter_icon_present?,
           'Facebook, Pinterest, and Twitter icons should be present.')
  end
end