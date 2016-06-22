$:.push '../lib/page'
require 'base_page'

class IngredientsPage < BasePage
  PAGE_URL = '/ingredients'

  # locators
  PAGE_HEADER = { :css => 'h1.ingredients-h1' }
  SKIP_INTRO_BTN = { :css => '.skip-btn' }
  INGREDIENTS_HEADERS = { :css => 'h4.ingredients-header' }
  VIEW_PRODUCTS_BTN = { :css => 'button.ingredients-button' }

  def initialize(driver)
    super(driver)
    visit(PAGE_URL)
    wait_for { displayed?(PAGE_HEADER) }
  end

  # methods
  def skip_intro
    click_on SKIP_INTRO_BTN
  end

  def get_ingredients_headers_count
    find_elements(INGREDIENTS_HEADERS).size
  end

  def get_view_products_btn_count
    find_elements(VIEW_PRODUCTS_BTN).size
  end

end