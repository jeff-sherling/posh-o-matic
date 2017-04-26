$LOAD_PATH.push 'lib/page'
require_relative 'base_test'
require 'header'

# Test header component
class HeaderTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox # :safari
    @header = Header.new @driver
  end

  def teardown
    @driver.quit
  end

  def test_posh_logo_link_redirects_correctly
    landing = @header.click_posh_logo
    assert(landing.public_page?, 'Landing page should be public.')
  end

  def test_products_link_redirects_correctly
    products = @header.click_products_link
    assert_equal(24, products.get_product_count,
                 'Should be 24 products on page.')
  end

  def test_collections_link_redirects_correctly
    collections = @header.click_collections_link
    assert_equal(24, collections.get_product_count,
                 'Should be 24 products on page.')
  end

  def test_join_link_redirects_correctly
    join = @header.click_join_link
    assert(join.page_title.include?('Join'), 'Page title should include Join.')
  end

  def test_rewards_link_redirects_correctly
    perks = @header.click_rewards_link
    assert(perks.page_title.include?('Perks About Page'),
           'Title should contain Perks About Page')
  end

  def test_products_submenu_visible_with_mouseover
    assert(@header.products_submenu_visible?,
           'Products submenu should be visible.')
  end

  def test_collections_submenu_visible_with_mouseover
    assert(@header.collections_submenu_visible?,
           'Collections submenu should be visible.')
  end

  def test_about_submenu_visible_with_mouseover
    assert(@header.about_submenu_visible?,
           'About submenu should be visible.')
  end

  def test_click_posh_team_about_submenu
    meet_team = @header.click_about_posh_team_submenu
    assert(meet_team.page_title.include?('Meet The Team'),
           'Page title should include Meet The Team.')
  end
end