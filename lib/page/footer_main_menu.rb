require 'base_page'
require 'join_page'
require 'ingredients_page'

# Main menu footer: Join Posh, Catalog, Ingredients, etc.
class FooterMainMenu < BasePage
  PAGE_URL = '/'.freeze

  # Selector strings
  catalog = "a[href^='/sites/default/files/catalog/']"

  # Block 191 locators
  JOIN_POSH = { css: "a[href='/join']" }.freeze
  CATALOG = { css: catalog }.freeze
  INGREDIENTS = { css: "a[href='/ingredients']" }.freeze
  CUSTOMER_CARE = { css: "a[href='/refund-policy']" }.freeze
  PHONE = { css: "a[href='tel:+18014411744']" }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed?JOIN_POSH }
  end

  def click_join_posh
    click_on JOIN_POSH
    JoinPage.new(@driver, false)
  end

  def click_ingredients
    click_on INGREDIENTS
    IngredientsPage.new(@driver, false)
  end
end