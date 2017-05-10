$LOAD_PATH.push 'lib/page'
require 'product_filter'
require 'products_page'
require_relative 'base_test'

# Test for filter/search field on Products page
class ProductFilterTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for BROWSER
    @filter = ProductFilter.new@driver
    @before = @filter.products_list
  end

  def teardown
    @driver.quit
  end

  def test_filter_by_hands_and_feet_products
    products = @filter.filter_by_hands_and_feet
    after = products.get_products
    assert(@before != after,
           'Products displayed before and after filtering should differ.')
  end

  def test_filter_by_face_and_lips_products
    products = @filter.filter_by_body
    after = products.get_products
    assert(@before != after,
           'Products displayed before and after filtering should differ.')
  end

  def test_filter_by_body_products
    products = @filter.filter_by_body
    after = products.get_products
    assert(@before != after,
           'Products displayed before and after filtering should differ.')
  end

  def test_filter_by_hair_products
    products = @filter.filter_by_hair
    after = products.get_products
    assert(@before != after,
           'Products displayed before and after filtering should differ.')
  end

  def test_filter_by_bath_products
    products = @filter.filter_checkbox
    after = products.get_products
    assert(@before != after,
           'Products displayed before and after filtering should differ.')
  end

  def test_search_for_chunk
    products = @filter.search_for_product
    after = products.get_products
    assert(@before != after,
           'Products displayed before and after filtering should differ.')
  end

  def test_search_for_lip_balm
    products = @filter.search_for_product('lip balm')
    after = products.get_products
    assert(@before != after,
           'Products displayed before and after filtering should differ.')
  end
end