require 'base_page'
require 'shopping_cart_page'

class ProductPage < BasePage

  # Locators
  UP_SPINNER_BTN = { :css => '.ui-spinner-up' }
  DOWN_SPINNER_BTN = { :css => '.ui-spinner-down' }
  ADD_TO_CART = { :css => "#edit-submit[value='Add to cart']" }
  OUT_OF_STOCK = { :css => '.form-button-disabled[disabled]' }
  PROD_PHOTO = { :css => '.product__gallery' }

  SUCCESS_ALERT = { :css => '.messages--status' }

  def initialize(driver, nav = true, prod_url = '/gender-bender-chunk')
    super(driver)
    visit(prod_url) if nav
    wait_for { displayed?(PROD_PHOTO) }
  end

  def shop_and_checkout
    add_to_cart
    ShoppingCartPage.new(driver, false)
  end

  def add_to_cart
    if displayed?(ADD_TO_CART)
      click_on ADD_TO_CART
    else
      Console.log.info "Unable to find 'Add To Cart' button."
    end
  end

  def is_item_in_stock?
    wait_for(5) { displayed?(OUT_OF_STOCK) }
  end

  def is_add_to_cart_successful?
    wait_for(5) { displayed?(SUCCESS_ALERT) }
  end

end