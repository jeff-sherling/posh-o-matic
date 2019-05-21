$LOAD_PATH.push 'lib/page'
require_relative 'base_test'
require 'header_products_sub_menu'

# Test Products submenu in Header
class HeaderProductsTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for BROWSER
    @header = HeaderProductsSubMenu.new @driver
  end

  def teardown
    @driver.quit
  end

  def test_hands_feet_collection_title
    products = @header.click_hands_feet_submenu
    assert(products.collection_title.include?('HANDS + FEET'),
           'Hands + Feet title should be present.')
  end

  def test_face_lips_collection_title
    products = @header.click_face_lips_submenu
    assert(products.collection_title.include?('FACE + LIPS'),
           'Face + Lips title should be present.')
  end

  def test_body_collection_title
    products = @header.click_body_submenu
    assert(products.collection_title.include?('BODY'),
           'Body title should be present.')
  end

  def test_hair_collection_title
    products = @header.click_hair_submenu
    assert(products.collection_title.include?('HAIR'),
           'Hair title should be present.')
  end

  def test_bath_collection_title
    products = @header.click_bath_submenu
    assert(products.collection_title.include?('BATH'),
           'Bath title should be present.')
  end
end