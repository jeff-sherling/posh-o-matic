$:.push '../lib/page'
require 'privacy_policy'
require_relative 'base_test'

class PrivacyPolicyTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @privacy_policy = PrivacyPolicy.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_page_title
    assert(@privacy_policy.title.include?('Privacy Policy'))
  end

end