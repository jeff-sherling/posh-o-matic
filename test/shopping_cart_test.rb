$:.push '../lib/page'
$:.push '../lib/log'
require 'shopping_cart_page'
require 'product_page'
require 'user_bar'
require 'console'
require_relative 'base_test'

class ShoppingCartTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @product_page = ProductPage.new(@driver, true, '/rolling-deep-chunk')
    @user_bar = UserBar.new(@driver)
    # @shopping_cart = ShoppingCartPage.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_cart_qty_updated_when_shopping
    # same as next test??
    Console.log.info "Count is #{@user_bar.get_cart_quantity}."
    initial_count = @user_bar.get_cart_quantity
    assert(initial_count == '0', 'Cart quantity should be zero (0).')
    @product_page.add_to_cart
    # TODO: need explicit wait
    sleep 5
    next_count = @user_bar.get_cart_quantity
    Console.log.info "Count is #{next_count}."
    assert(next_count == '1', 'Cart quantity should be one (1).')
    #assert(@product_page.is_add_to_cart_successful?, 'Success message did not display.')

    # shopping_cart = ShoppingCartPage.new(@driver)
  end

  def test_alert_when_item_added_to_cart
    # same as previous test??
    Console.log.info "Count is #{@user_bar.get_cart_quantity}."
    assert(@user_bar.get_cart_quantity == '0', 'Cart quantity should be zero (0).')
    @product_page.add_to_cart
    # TODO: need explicit wait
    sleep 2
    Console.log.info "Count is #{@user_bar.get_cart_quantity}."
    assert(@user_bar.get_cart_quantity == '1', 'Cart quantity should be one (1).')
    #assert(@product_page.is_add_to_cart_successful?, 'Success message did not display.')

    # shopping_cart = ShoppingCartPage.new(@driver)
  end

end