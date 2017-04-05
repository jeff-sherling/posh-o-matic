$LOAD_PATH.push 'lib/page'
require_relative 'base_test'
require 'footer_social'

# Test social block in footer
class FooterSocialTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @social = FooterSocial.new @driver
  end

  def teardown
    @driver.quit
  end

  def test_social_icons_present
    assert_equal(5, @social.social_icons_count,
                 'Should be five social media icons.')
    assert(@social.facebook_link_present? && @social.twitter_link_present? &&
          @social.instgram_link_present? && @social.pinterest_link_present? &&
          @social.youtube_link_present?,
           'All social media links should be present.')
  end
end