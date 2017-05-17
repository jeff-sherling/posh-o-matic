require 'base_page'

# Storefront/Shop/Products (/products) page
class ProductsPage < BasePage
  PAGE_URL = '/products'.freeze

  # Locator strings
  collection_title = '#block-views-shop-menus-block-3 .views-field-nothing h2'

  # Locators
  COLLECTION_TITLE = { css: collection_title }.freeze
  GRID_VIEW_TOGGLE = { css: '.product__grid-view-toggle' }.freeze
  PRODUCT_CONTENT = { css: '.view-product-grid .views-row' }.freeze

  NEXT_PAGE = { css: '.pager__item--next a' }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed? GRID_VIEW_TOGGLE }
  end

  def product_count
    find_elements(PRODUCT_CONTENT).size
  end

  def products_list
    find_elements PRODUCT_CONTENT
  end

  def collection_title
    text_of COLLECTION_TITLE
  end
end