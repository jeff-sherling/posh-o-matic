$LOAD_PATH.push 'lib/page'
require_relative 'base_test'
require 'shopping_cart_empty'
require 'products_page'

# Test for empty shopping cart.
class ShoppingCartEmptyTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @shopping_cart = ShoppingCartEmpty.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_visit_shop_button
    products_page = @shopping_cart.click_visit_shop
    assert_includes(products_page.page_title, 'Products',
                    'Link should redirect to Products page.')
  end
end