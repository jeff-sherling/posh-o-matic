require 'base_page'

# Shopping Cart (/cart) page when empty
class ShoppingCartEmpty < BasePage
  PAGE_URL = '/cart'.freeze

  # Locator
  PROGRESS_BAR = { id: 'block-commerce-checkout-progress-indication' }.freeze
  VISIT_SHOP_BTN = { css: ".btn.lime[href$='/products']" }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed? PROGRESS_BAR }
  end

  def click_visit_shop
    click_on VISIT_SHOP_BTN
    ProductsPage.new(@driver, false)
  end

  def visit_shop_btn_present?
    wait_for { displayed? VISIT_SHOP_BTN }
  end
end