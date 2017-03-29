$LOAD_PATH.push 'lib/page'
require 'privacy_policy_page'
require_relative 'base_test'

# Test Privacy Policy page.
class PrivacyPolicyPageTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @privacy_policy = PrivacyPolicyPage.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_page_header_is_privacy_policy
    assert(@privacy_policy.page_header_text.downcase.include?('privacy policy'),
           'Page header should be Privacy Policy.')
  end

  def test_privacy_policy_title
    assert(@privacy_policy.page_title.include?('Privacy Policy'))
  end
end