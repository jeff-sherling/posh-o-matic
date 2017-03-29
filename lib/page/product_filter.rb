require 'base_page'
require 'products_page'

class ProductFilter < BasePage
  PAGE_URL = '/products'

  HANDS_AND_FEET_CBOX = { id: 'handsfeet' }
  FACE_AND_LIPS_CBOX = { id: 'facelips' }
  BODY_CBOX = { id: 'body' }
  HAIR_CBOX = { id: 'hair' }
  BATH_CBOX = { id: 'bath' }

  SEARCH_BOX = { css: 'input.block__product-grid__input-field' }
  SEARCH_ICON = { css: 'a.block__product-grid__search-button' }
  APPLY_BTN = { css: 'button.block__product-grid__filter' }

  PRODUCT_CONTENT = { css: '.view-product-grid .views-row' }

  def initialize(driver, nav = true)
    super driver
    visit PAGE_URL if nav
    wait_for { displayed? APPLY_BTN }
  end

  def filter_checkbox(checkbox = BATH_CBOX)
    unless find(checkbox).selected?
      click_on checkbox
    end
    click_on APPLY_BTN
    ProductsPage.new(driver, false)
  end

  def filter_by_hands_and_feet
    filter_checkbox HANDS_AND_FEET_CBOX
  end

  def filter_by_face_and_lips
    filter_checkbox FACE_AND_LIPS_CBOX
  end

  def filter_by_body
    filter_checkbox BODY_CBOX
  end

  def filter_by_hair
    filter_checkbox HAIR_CBOX
  end

  def search_for_product(term = 'chunk')
    type(SEARCH_BOX, term)
    click_on SEARCH_ICON
    ProductsPage.new(driver, false)
  end

  def get_products
    find_elements PRODUCT_CONTENT
  end

end