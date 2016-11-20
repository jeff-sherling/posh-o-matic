require 'base_page'
require_relative 'products_page'

class ShoppingCartPage < BasePage
  PAGE_URL = '/cart'

  CHECKOUT_PROGRESS = { :id => 'block-commerce-checkout-progress-indication' }
  VISIT_SHOP_BTN = { :css => ".btn.lime[href$='/products']" }

  CART_ROWS = { :css => '#views-form-commerce-cart-form-default tbody tr' }
  BUY_WITH_PERKS = { :css => 'input.buy_with_points_button' }
  UP_ARROW = { :css => 'a.ui-spinner-up' }
  DOWN_ARROW = { :css => 'a.ui-spinner-up' }
  DELETE_ITEM = { :css => "[id^='edit-edit-delete-']" }
  CONTINUE_SHOPPING = { :css => "a.keep-shopping[href$='/products']" }
  CHECKOUT = { :id => 'edit-checkout' }

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed? CHECKOUT_PROGRESS }
  end

  def click_visit_shop
    # Only available when cart is empty
    click_on VISIT_SHOP_BTN
    ProductsPage.new(@driver, false)
  end

  def get_products_count
    rows = find_elements CART_ROWS
    rows.size
  end

end