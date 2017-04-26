require 'base_page'
require 'shopping_cart_page'
require 'user_bar'

# Product (e.g., /full-moon-chunk) page.
class ProductPage < BasePage
  # Locators
  PROD_PHOTO = { css: '.product__gallery' }.freeze
  QUANTITY_BOX = { id: 'edit-quantity' }.freeze
  UP_SPINNER_BTN = { css: '.ui-spinner-up' }.freeze
  DOWN_SPINNER_BTN = { css: '.ui-spinner-down' }.freeze
  ADD_TO_CART = { css: '#edit-submit.form-submit' }.freeze
  OUT_OF_STOCK = { css: '.form-button-disabled[disabled]' }.freeze

  SUCCESS_ALERT = { css: '.messages--status' }.freeze

  def initialize(driver, prod_url = '/gender-bender-chunk', nav = true)
    super driver
    @url = prod_url
    visit prod_url if nav
    wait_for { displayed?PROD_PHOTO }
  end

  def add_quantity_to_cart(quantity = 1)
    clear QUANTITY_BOX
    type QUANTITY_BOX, quantity
    add_to_cart
  end

  def add_to_cart
    if displayed? ADD_TO_CART
      click_on ADD_TO_CART
      ProductPage.new @driver, @url, false
    elsif displayed? OUT_OF_STOCK
      Console.log.info "'Out of Stock' button displayed."
      raise Selenium::WebDriver::Error::NoSuchElementError
    else
      Console.log.info "Unable to find 'Add To Cart' button."
      raise Selenium::WebDriver::Error::NoSuchElementError
    end
  end

  def quantity_value
    find(QUANTITY_BOX).attribute('aria-valuenow')
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