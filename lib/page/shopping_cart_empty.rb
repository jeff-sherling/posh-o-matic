require 'base_page'

class ShoppingCartEmpty < BasePage
  PAGE_URL = '/cart'

  # Locator
  CHECKOUT_PROGRESS = { id: 'block-commerce-checkout-progress-indication' }
  VISIT_SHOP_BTN = { css: ".btn.lime[href$='/products']" }

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed? CHECKOUT_PROGRESS }
  end

  def click_visit_shop
    click_on VISIT_SHOP_BTN
    ProductsPage.new(@driver, false)
  end

  def visit_shop_btn_present?
    wait_for { displayed? VISIT_SHOP_BTN }
  end

end