require 'base_page'
require 'shopping_cart_page'
require 'user_bar'

# Product (e.g., /full-moon-chunk) page.
class ProductPage < BasePage
  # Locators
  UP_SPINNER_BTN = { css: '.ui-spinner-up' }.freeze
  DOWN_SPINNER_BTN = { css: '.ui-spinner-down' }.freeze
  ADD_TO_CART = { css: '#edit-submit.form-submit' }.freeze
  OUT_OF_STOCK = { css: '.form-button-disabled[disabled]' }.freeze
  PROD_PHOTO = { css: '.product__gallery' }.freeze

  SUCCESS_ALERT = { css: '.messages--status' }.freeze

  def initialize(driver, prod_url = '/gender-bender-chunk', nav = true)
    super(driver)
    visit prod_url if nav
    wait_for { displayed?PROD_PHOTO }
  end

  def shop_and_checkout
    add_to_cart
    ShoppingCartPage.new(driver, false)
  end

  def add_to_cart
    if displayed? ADD_TO_CART
      click_on ADD_TO_CART
    else
      Console.log.info "Unable to find 'Add To Cart' button."
      raise Selenium::WebDriver::Error::NoSuchElementError,
            "'Add To Cart' button not found."
    end
  end

  def item_in_stock?
    wait_for(5) { displayed?OUT_OF_STOCK }
  end

  def success_alert_present?
    wait_for(10) { displayed?SUCCESS_ALERT }
  end

  def cart_icon_total
    UserBar.new(@driver, false).cart_quantity
  end
end