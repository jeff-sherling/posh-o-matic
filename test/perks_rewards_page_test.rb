$LOAD_PATH.push 'lib/page'
require 'perks_rewards_page'
require_relative 'base_test'

# Test Perks Rewards page
class PerksRewardsPageTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @perks = PerksRewardsPage.new@driver
  end

  def teardown
    @driver.quit
  end

  def test_banner_container_count
    assert_equal(@perks.banner_container_count, 7, 'Should be 7 containers.')
  end

  def test_page_title
    assert(@perks.page_title.include?('Perks About Page'),
           'Title should include Perks About Page')
  end

  def test_element_counts_are_correct
    assert(@perks.started_button_count >= 2,
           'Should be more than 2 Get Started links.')
  end

  def test_enroll_btn_links_to_get_started_page
    get_started = @perks.click_get_started
    assert(get_started.email_box_present?,
           'Email box should be present on Get Started page.')
  end
end