$LOAD_PATH.push 'lib/page'
require 'product_page'
require 'products_page'
require 'shopping_cart_page'
require 'shopping_cart_empty'
require_relative 'base_test'

# Test Shopping Cart (/cart) page.
class ShoppingCartTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @product_page = ProductPage.new@driver, '/rolling-deep-chunk'
  end

  def teardown
    @driver.quit
  end

  def test_add_cart_btn_adds_item_to_cart
    @product_page.add_to_cart
    assert(@product_page.success_alert_present?,
           'Success message did not display.')
    cart = ShoppingCartPage.new@driver
    assert(cart.row_count == 1, 'Should only be one product in cart.')
  end

  def test_visit_shop_btn_appears_when_items_removed
    @product_page.add_to_cart
    assert(@product_page.success_alert_present?,
           'Success message did not display.')
    cart = ShoppingCartPage.new@driver
    empty = cart.remove_item
    assert(empty.visit_shop_btn_present?,
           'Visit Shop button should be present.')
  end

  def test_continue_shopping_link
    @product_page.add_to_cart
    assert(@product_page.success_alert_present?,
           'Success message did not display.')
    cart = ShoppingCartPage.new@driver
    products = cart.continue_shopping
    assert(products.get_product_count == 24, 'Should land on Products page')
  end
end