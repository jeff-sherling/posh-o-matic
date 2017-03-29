require 'base_page'

# /ingredients page.
class IngredientsPage < BasePage
  PAGE_URL = '/ingredients'.freeze

  # locators
  PAGE_HEADER = { css: 'h1.ingredients-h1' }.freeze
  SKIP_INTRO_BTN = { css: '.skip-btn' }.freeze
  INGREDIENTS_HEADERS = { css: 'h4.ingredients-header' }.freeze
  VIEW_PRODUCTS_BTN = { css: 'button.ingredients-button' }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit(PAGE_URL) if nav
    wait_for { displayed?(PAGE_HEADER) }
  end

  def skip_intro
    click_on SKIP_INTRO_BTN
  end

  def ingredients_headers_count
    find_elements(INGREDIENTS_HEADERS).size
  end

  def view_products_btn_count
    find_elements(VIEW_PRODUCTS_BTN).size
  end
end