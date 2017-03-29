$:.push '../lib/page'
require 'product_filter'
require 'products_page'
require_relative 'base_test'

class ProductFilterTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @filter = ProductFilter.new(@driver)
    @before = @filter.get_products
  end

  def teardown
    @driver.quit
  end

  def test_filter_by_hands_and_feet_products
    products = @filter.filter_by_hands_and_feet
    after = products.get_products
    assert(@before != after, 'Products appearing prior to filtering should be different than after.')
  end

  def test_filter_by_face_and_lips_products
    products = @filter.filter_by_body
    after = products.get_products
    assert(@before != after, 'Products appearing prior to filtering should be different than after.')
  end

  def test_filter_by_body_products
    products = @filter.filter_by_body
    after = products.get_products
    assert(@before != after, 'Products appearing prior to filtering should be different than after.')
  end

  def test_filter_by_hair_products
    products = @filter.filter_by_hair
    after = products.get_products
    assert(@before != after, 'Products appearing prior to filtering should be different than after.')
  end

  def test_filter_by_bath_products
    products = @filter.filter_checkbox
    after = products.get_products
    assert(@before != after, 'Products appearing prior to filtering should be different than after.')
  end

  def test_search_for_chunk
    products = @filter.search_for_product
    after = products.get_products
    assert(@before != after, 'Products appearing before search should be different than after.')
  end

  def test_search_for_lip_balm
    products = @filter.search_for_product('lip balm')
    after = products.get_products
    assert(@before != after, 'Products appearing before search should be different than after.')
  end

end