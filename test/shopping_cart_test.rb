$:.push '../lib/page'
require 'product_page'
require 'shopping_cart_page'
require 'shopping_cart_empty'
require_relative 'base_test'

class ShoppingCartTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @product_page = ProductPage.new(@driver, '/rolling-deep-chunk')
  end

  def teardown
    @driver.quit
  end

  def test_add_cart_btn_adds_item_to_cart
    @product_page.add_to_cart
    assert(@product_page.is_success_alert_present?, 'Success message did not display.')
    cart = ShoppingCartPage.new(@driver)
    assert(cart.get_rows_count == 1, 'Should only be one product in cart.')
  end

  def test_visit_shop_btn_appears_when_only_item_removed
    @product_page.add_to_cart
    assert(@product_page.is_success_alert_present?, 'Success message did not display.')
    cart = ShoppingCartPage.new(@driver)
    empty = cart.remove_item
    assert(empty.visit_shop_btn_present?, 'Visit Shop button should be present.')
  end

end