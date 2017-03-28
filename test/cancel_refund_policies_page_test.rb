$LOAD_PATH.push 'lib/page'
require 'cancel_refund_policies_page'
require_relative 'base_test'

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

  def test_subheading_count
    assert_equal(@cancel.bold_subheading_count, 3,
                 'Should be 3 subheadings.')
  end
end