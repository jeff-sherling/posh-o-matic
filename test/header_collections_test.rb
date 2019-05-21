$LOAD_PATH.push 'lib/page'
require_relative 'base_test'
require 'header_collections_sub_menu'
require 'products_page'

# Test Header > Collections submenu items
class HeaderCollectionsTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for BROWSER
    @collections = HeaderCollectionsSubMenu.new @driver
  end

  def teardown
    @driver.quit
  end

  def test_new_products_title
    products = @collections.click_new_products_submenu
    assert(products.collection_title.include?('NEW PRODUCTS'),
           'New Products title should be present.')
  end

  def test_hair_care_title
    products = @collections.click_hair_care_submenu
    assert(products.collection_title.include?('HAIR CARE'),
           'Hair Care title should be present.')
  end

  def test_posh_kit_title
    products = @collections.click_posh_kit_submenu
    assert(products.collection_title.include?('POSH KIT'),
           'Posh Kit title should be present.')
  end

  def test_specials_title
    products = @collections.click_specials_submenu
    assert(products.collection_title.include?('SPECIALS'),
           'Specials title should be present.')
  end

  def test_hand_creme_title
    products = @collections.click_hand_creme_submenu
    assert(products.collection_title.include?('HAND CR'),
           'Hand Creme title should be present.')
  end

  def test_scrubby_title
    products = @collections.click_scrubby_submenu
    assert(products.collection_title.include?('SCRUBBY'),
           'Scrubby title should be present.')
  end

  def test_retired_title
    products = @collections.click_retired_submenu
    assert(products.collection_title.include?('RETIRED'),
           'Retired title should be present.')
  end

  def test_lips_title
    products = @collections.click_lips_submenu
    assert(products.collection_title.include?('LIPS'),
           'Lips title should be present.')
  end

  def test_seasonal_title
    products = @collections.click_seasonal_submenu
    assert(products.collection_title.include?('SEASONAL'),
           'Seasonal title should be present.')
  end

  def test_all_mixd_up_title
    products = @collections.click_all_mixd_up_submenu
    assert(products.collection_title.include?('ALL MIXD UP'),
           'All Mixd Up title should be present.')
  end
end