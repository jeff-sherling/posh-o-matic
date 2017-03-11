require 'base_page'
require_relative 'products_page'
require_relative 'shopping_cart_empty'

class ShoppingCartPage < BasePage
  PAGE_URL = '/cart'

  # Locators
  SUCCESS_ALERT = { :css => '.messages.messages--status' }

  CHECKOUT_PROGRESS = { :id => 'block-commerce-checkout-progress-indication' }

  LINE_ITEM_TOTAL = { :css => 'tr.component-type-commerce-price-formatted-amount' }

  BUY_WITH_PERKS_BTN = { :css => "[id^='edit-edit-points-'] > .buy_with_points_button" }
  DISABLED_BUY_PERKS_BTN = { :css => '.disabled > input.buy_with_points_button' }

  QTY_UP_ARROW = { :css => 'a.ui-spinner-up' }
  QTY_DOWN_ARROW = { :css => 'a.ui-spinner-down' }
  UPDATE_CART_BTN = { :css => '' }
  REMOVE_ITEM = { :css => "[id^='edit-edit-delete-']" }
  CONTINUE_SHOPPING = { :css => "a.keep-shopping[href$='/products']" }
  CHECKOUT_BTN = { :id => 'edit-checkout' }

  def initialize(driver, nav = true)
    @driver = super(driver)
    visit PAGE_URL if nav
    wait_for { displayed? CHECKOUT_PROGRESS }
  end

  def get_rows_count
    find_elements(LINE_ITEM_TOTAL).size
  end

  def remove_item(remove_row_number = 1)
    rows = get_rows_count
    puts "Rows: #{rows}"
    unless remove_row_number.is_a? Fixnum
      raise ArgumentError.new('Argument should be an integer.')
    end
    if rows > 0
      element = @driver.find_elements(REMOVE_ITEM)[remove_row_number - 1]
      click_action element
    end
    if rows == 1
      ShoppingCartEmpty.new(driver, false)
    elsif rows > 1
      ShoppingCartPage.new(driver, false)
    else
      ShoppingCartPage.new(driver)
    end
  end

end