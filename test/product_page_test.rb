$:.push '../lib/page'
require 'product_page'
require 'user_bar'
require_relative 'base_test'

class ProductPageTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @product_page = ProductPage.new(@driver, '/rolling-deep-chunk')
  end

  def teardown
    @driver.quit
    end

  def test_alert_when_adding_to_cart
    @product_page.add_to_cart
    assert(@product_page.is_success_alert_present?, 'Success message did not display.')
    end

  def test_cart_qty_incremented
    @user_bar = UserBar.new(@driver)
    initial_total = @user_bar.get_cart_quantity
    @product_page.add_to_cart
    assert(@product_page.is_success_alert_present?, 'Success message did not display.')
    new_total = @user_bar.get_cart_quantity
    assert(new_total != initial_total, 'Cart quantity should be one (1).')
  end

end