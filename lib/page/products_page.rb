require 'base_page'

class ProductsPage < BasePage
  PAGE_URL = '/products'

  GRID_VIEW_TOGGLE = { :css => '.product__grid-view-toggle' }

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed? GRID_VIEW_TOGGLE }
  end


end