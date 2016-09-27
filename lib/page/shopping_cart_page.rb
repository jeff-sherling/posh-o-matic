require 'base_page'

class ShoppingCartPage < BasePage
  PAGE_URL = '/cart'

  PAGE_HEADER = { :css => 'h1.node-title' }

  BUY_WITH_PERKS = { :css => 'input.buy_with_points_button' }
  UP_ARROW = { :css => 'a.ui-spinner-up' }
  DOWN_ARROW = { :css => 'a.ui-spinner-up' }
  DELETE_ITEM = { :css => "[id^='edit-edit-delete-']" }
  CONTINUE_SHOPPING = { :css => "a.keep-shopping[href$='/products']" }
  CHECKOUT = { :id => 'edit-checkout' }

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed?(PAGE_HEADER) }
  end

end