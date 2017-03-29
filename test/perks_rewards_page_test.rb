$:.push '../lib/page'
require 'perks_rewards_page'
require_relative 'base_test'

class PerksRewardsPageTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @perks_rewards = PerksRewardsPage.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_element_counts_are_correct
    assert_equal(@perks_rewards.get_started_count, 4, 'Should be 4 Get Started links.')
    assert_equal(@perks_rewards.get_earn_box_count, 4, 'Should be 4 Earn Perks boxes.')
    assert_equal(@perks_rewards.get_faq_link_count, 4, 'Should be 4 FAQ links.')
    assert_equal(@perks_rewards.get_redeem_box_count, 4, 'Should be 4 Redeem Perks boxes.')
  end

  def test_subheadings_are_present
    assert(@perks_rewards.faq_heading_present?, 'FAQ heading should be present.')
    assert(@perks_rewards.terms_heading_present?, 'Terms & Conditions heading should be present.')
  end

  def test_get_started_redirects_correctly
    get_started = @perks_rewards.click_get_started
    assert(get_started.email_box_present?, 'Email box should be present on Get Started page.')
  end

end