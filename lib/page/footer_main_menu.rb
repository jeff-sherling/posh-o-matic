require 'base_page'
require 'join_page'
require 'ingredients_page'

class FooterMainMenu < BasePage
  PAGE_URL = '/'

  # Block 191 locators
  JOIN_POSH = { :css => "a[href='/join']" }
  CATALOG = { :css => "a[href='/sites/default/files/posh_paper_interactive.pdf']" }
  INGREDIENTS = { :css => "a[href='/ingredients']" }
  CUSTOMER_CARE = { :css => "a[href='/refund-policy']" }
  PHONE = { :css => "a[href='tel:+18014411744']" }

  def initialize(driver, nav = true)
    super(driver)
    visit(PAGE_URL) if nav
    wait_for { displayed?(JOIN_POSH) }
  end

  def click_join_posh
    click_on(JOIN_POSH)
    JoinPage.new(@driver, false)
  end

  def click_catalog
    click_on(CATALOG)
    # CatalogPage.new(@drive, false)
  end

  def click_ingredients
    click_on(INGREDIENTS)
    IngredientsPage.new(@driver, false)
  end

end