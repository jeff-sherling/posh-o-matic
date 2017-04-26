require 'base_page'
require_relative 'products_page'
require_relative 'shopping_cart_empty'

# Shopping cart (/cart) page
class ShoppingCartPage < BasePage
  PAGE_URL = '/cart'.freeze

  # Selector strings
  checkout_progress = 'block-commerce-checkout-progress-indication'
  line_item_total = 'tr.component-type-commerce-price-formatted-amount'
  buy_with_perks_btn = "[id^='edit-edit-points-'] > .buy_with_points_button"
  disabled_buy_perks_btn = '.disabled > input.buy_with_points_button'

  # Locators
  SUCCESS_ALERT = { css: '.messages.messages--status' }.freeze

  CHECKOUT_PROGRESS = { id: checkout_progress }.freeze
  LINE_ITEM_TOTAL = { css: line_item_total }.freeze
  BUY_WITH_PERKS_BTN = { css: buy_with_perks_btn }.freeze
  DISABLED_BUY_PERKS_BTN = { css: disabled_buy_perks_btn }.freeze
  QTY_UP_ARROW = { css: 'a.ui-spinner-up' }.freeze
  QTY_DOWN_ARROW = { css: 'a.ui-spinner-down' }.freeze
  UPDATE_CART_BTN = { css: '' }.freeze
  REMOVE_ITEM = { css: "[id^='edit-edit-delete-']" }.freeze

  CONTINUE_SHOPPING = { css: "a.keep-shopping[href$='/products']" }.freeze
  CHECKOUT_BTN = { id: 'edit-checkout' }.freeze

  def initialize(driver, nav = true)
    @driver = super(driver)
    visit PAGE_URL if nav
    wait_for { displayed? CHECKOUT_PROGRESS }
  end

  def row_count
    find_elements(LINE_ITEM_TOTAL).size
  end

  def remove_item(remove_row_number = 1)
    @rows = row_count
    remove_row(remove_row_number)
    if @rows == 1
      ShoppingCartEmpty.new @driver, false
    elsif @rows > 1
      ShoppingCartPage.new @driver, false
    else
      ShoppingCartPage.new @driver
    end
  end

  def continue_shopping
    click_on CONTINUE_SHOPPING
    ProductsPage.new @driver, false
  end

  private

  def remove_row(remove_row_number)
    raise ArgumentError 'Argument should be an integer.' unless
        remove_row_number.is_a? Fixnum
    if @rows > 0
      element = @driver.find_elements(REMOVE_ITEM)[remove_row_number - 1]
      click_action element
    end
  end
end