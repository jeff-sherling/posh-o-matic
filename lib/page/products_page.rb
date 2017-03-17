require 'base_page'

class ProductsPage < BasePage
  PAGE_URL = '/products'

  GRID_VIEW_TOGGLE = { css: '.product__grid-view-toggle' }
  PRODUCT_CONTENT = { css: '.view-product-grid .views-row' }

  NEXT_PAGE = { css: '.pager__item--next a' }

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed? GRID_VIEW_TOGGLE }
  end

  def get_product_count
    find_elements(PRODUCT_CONTENT).size
  end

  def get_products
    find_elements PRODUCT_CONTENT
  end

end