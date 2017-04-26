require 'base_page'
require 'products_page'

# Filter checkboxes and search field on Products (/prooducts) page
class ProductFilter < BasePage
  PAGE_URL = '/products'.freeze

  FILTERED_VIEW_HEADING = { css: '.views-field-nothing > span > h2' }.freeze
  HANDS_AND_FEET_CBOX = { id: 'handsfeet' }.freeze
  FACE_AND_LIPS_CBOX = { id: 'facelips' }.freeze
  BODY_CBOX = { id: 'body' }.freeze
  HAIR_CBOX = { id: 'hair' }.freeze
  BATH_CBOX = { id: 'bath' }.freeze

  SEARCH_BOX = { css: 'input.block__product-grid__input-field' }.freeze
  SEARCH_ICON = { css: 'a.block__product-grid__search-button' }.freeze
  APPLY_BTN = { css: 'button.block__product-grid__filter' }.freeze

  PRODUCT_CONTENT = { css: '.view-product-grid .views-row' }.freeze

  def initialize(driver, nav = true)
    super driver
    visit PAGE_URL if nav
    wait_for { displayed? APPLY_BTN }
  end

  def filtered_content_heading?
    # Appears after selecting Products/Collections submenu item
    text_of FILTERED_VIEW_HEADING
  end

  def filter_checkbox(checkbox = BATH_CBOX)
    click_on checkbox unless find(checkbox).selected?
    click_on APPLY_BTN
    ProductsPage.new @driver, false
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
    type SEARCH_BOX, term
    click_on SEARCH_ICON
    ProductsPage.new @driver, false
  end

  def products_list
    find_elements PRODUCT_CONTENT
  end
end