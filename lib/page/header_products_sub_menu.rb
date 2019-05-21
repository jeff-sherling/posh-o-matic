require 'base_page'
require 'products_page'

# Header > Products submenu
class HeaderProductsSubMenu < BasePage
  PAGE_URL = '/'.freeze

  # Locator strings
  prefix = '.block__content.fade'
  hands_feet = "#{prefix} .views-row-1 a[href$='/products/hands-feet']"
  face_lips = "#{prefix} .views-row-2 a[href$='/products/face-lips']"
  body = "#{prefix} .views-row-3 a[href$='/products/body']"
  hair = "#{prefix} .views-row-4 a[href$='/products/hair']"
  bath = "#{prefix} .views-row-5 a[href$='/products/bath']"

  # Locators
  PRODUCTS_LINK = { css: '#superfish-2 #shop-product-categories' }.freeze
  HANDS_FEET_SUBMENU = { css: hands_feet }.freeze
  FACE_LIPS_SUBMENU = { css: face_lips }.freeze
  BODY_SUBMENU = { css: body }.freeze
  HAIR_SUBMENU = { css: hair }.freeze
  BATH_SUBMENU = { css: bath }.freeze

  def initialize(driver, nav = true)
    super driver
    visit PAGE_URL if nav
    wait_for { displayed? PRODUCTS_LINK }
  end

  def click_hands_feet_submenu
    click_submenu HANDS_FEET_SUBMENU
    ProductsPage.new @driver, false
  end

  def click_face_lips_submenu
    click_submenu FACE_LIPS_SUBMENU
    ProductsPage.new @driver, false
  end

  def click_body_submenu
    click_submenu BODY_SUBMENU
    ProductsPage.new @driver, false
  end

  def click_hair_submenu
    click_submenu HAIR_SUBMENU
    ProductsPage.new @driver, false
  end

  def click_bath_submenu
    click_submenu BATH_SUBMENU
    ProductsPage.new @driver, false
  end

  private

  def click_submenu(submenu_item)
    hover find PRODUCTS_LINK
    wait_for(5) { displayed? BATH_SUBMENU }
    click_on submenu_item
  end
end