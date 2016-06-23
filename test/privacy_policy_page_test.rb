$:.push '../lib/page'
require 'privacy_policy_page'
require_relative 'base_test'

class PrivacyPolicyPageTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @privacy_policy = PrivacyPolicyPage.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_page_header_is_privacy_policy
    assert(@privacy_policy.get_page_header_text.downcase.include?('privacy policy'),
           "Page header should be 'privacy policy' but is #{@privacy_policy.get_page_header_text}.")
  end

  def test_page_title
    assert(@privacy_policy.title.include?('Privacy Policy'))
  end

end