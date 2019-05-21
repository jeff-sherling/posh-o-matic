$LOAD_PATH.push 'lib/page'
require 'product_page'
require 'user_bar'
require_relative 'base_test'

# Test Product page (e.g., /full-moon-chunk).
class ProductPageTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for BROWSER
    @product = ProductPage.new(@driver, '/rolling-deep-chunk')
  end

  def teardown
    @driver.quit
  end

  def test_success_alert_when_adding_to_cart
    @product.add_to_cart
    assert(@product.success_alert_present?,
           'Success message should be displayed.')
  end

  def test_cart_qty_increments_when_one_product_added
    initial_total = @product.cart_icon_total
    @product.add_to_cart
    assert(@product.success_alert_present?,
           'Success message should be displayed.')
    new_total = @product.cart_icon_total
    assert(new_total != initial_total, 'Cart quantity should be one (1).')
  end

  def test_default_quantity_value_is_1
    assert_equal('1', @product.quantity_value, 'Default value should be 1.')
  end

  def test_cart_qty_matches_amount_added_to_cart
    amount = 1 + rand(20)
    @product.add_quantity_to_cart(amount)
    assert(@product.success_alert_present?,
           'Success message should be displayed.')
    assert_equal(amount.to_s, @product.cart_icon_total,
                 "Cart icon should display #{amount}.")
  end
end