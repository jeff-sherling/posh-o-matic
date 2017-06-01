require_relative 'base_page'

# Header > Collections submenu
class HeaderCollectionsSubMenu < BasePage
  PAGE_URL = '/'.freeze

  # Locator strings
  prefix = '.block__content.fade'
  new_products = "#{prefix} .views-row-1 a[href$='/products/new-products']"
  hair_care = "#{prefix} .views-row-2 a[href$='/products/hair-care']"
  posh_kit = "#{prefix} .views-row-3 a[href$='/products/posh-kit']"
  specials = "#{prefix} .views-row-4 a[href$='/products/specials']"
  hand_creme = "#{prefix} .views-row-5 a[href$='/products/bfyhc']"
  scrubby = "#{prefix} .views-row-6 a[href$='/products/scrubby']"
  retired = "#{prefix} .views-row-7 a[href$='/products/retired']"
  lips = "#{prefix} .views-row-8 a[href$='/products/lips']"
  seasonal = "#{prefix} .views-row-9 a[href$='/products/seasonal']"
  all_mixd_up = "#{prefix} .views-row-10 a[href$='/products/all-mixd']"
  look_natural = "#{prefix} .views-row-11 a[href$='/products/look-natural']"
  skin_sticks = "#{prefix} .views-row-12 a[href$='/products/skin-sticks']"
  body_mud = "#{prefix} .views-row-13 a[href$='/products/body-mud']"
  play_footsie = "#{prefix} .views-row-14 a[href$='/products/play-footsie']"
  specialty_face = "#{prefix} .views-row-15 a[href$='/products/specialty-face']"
  chunks = "#{prefix} .views-row-16 a[href$='/products/chunks']"
  posh_body = "#{prefix} .views-row-17 a[href$='/products/posh-body']"
  vegan = "#{prefix} .views-row-18 a[href$='/products/vegan']"
  face_masks = "#{prefix} .views-row-19 a[href$='/products/face-masks']"

  # Locators
  COLLECTIONS_LINK = { css: '#superfish-2 #shop-posh-collections' }.freeze
  NEW_PRODUCTS = { css: new_products }.freeze
  HAIR_CARE = { css: hair_care }.freeze
  POSH_KIT = { css: posh_kit }.freeze
  SPECIALS = { css: specials }.freeze
  HAND_CREME = { css: hand_creme }.freeze
  SCRUBBY = { css: scrubby }.freeze
  RETIRED = { css: retired }.freeze
  LIPS = { css: lips }.freeze
  SEASONAL = { css: seasonal }.freeze
  ALL_MIXD_UP = { css: all_mixd_up }.freeze
  LOOK_NATURAL = { css: look_natural }.freeze
  SKIN_STICKS = { css: skin_sticks }.freeze
  BODY_MUD = { css: body_mud }.freeze
  PLAY_FOOTSIE = { css: play_footsie }.freeze
  SPECIALTY_FACE = { css: specialty_face }.freeze
  CHUNKS = { css: chunks }.freeze
  POSH_BODY = { css: posh_body }.freeze
  VEGAN = { css: vegan }.freeze
  FACE_MASKS = { css: face_masks }.freeze

  def initialize(driver, nav = true)
    super driver
    visit PAGE_URL if nav
    wait_for(30) { displayed? COLLECTIONS_LINK }
  end

  def click_new_products_submenu
    click_submenu NEW_PRODUCTS
  end

  def click_hair_care_submenu
    click_submenu HAIR_CARE
  end

  def click_posh_kit_submenu
    click_submenu POSH_KIT
  end

  def click_specials_submenu
    click_submenu SPECIALS
  end

  def click_hand_creme_submenu
    click_submenu HAND_CREME
  end

  def click_scrubby_submenu
    click_submenu SCRUBBY
  end

  def click_retired_submenu
    click_submenu RETIRED
  end

  def click_lips_submenu
    click_submenu LIPS
  end

  def click_seasonal_submenu
    click_submenu SEASONAL
  end

  def click_all_mixd_up_submenu
    click_submenu ALL_MIXD_UP
  end

  def click_look_natural_submenu
    click_submenu LOOK_NATURAL
  end

  def click_skin_sticks_submenu
    click_submenu SKIN_STICKS
  end

  def click_body_mud_submenu
    click_submenu BODY_MUD
  end

  def click_play_footsie_submenu
    click_submenu PLAY_FOOTSIE
  end

  def click_specialty_face_submenu
    click_submenu SPECIALTY_FACE
  end

  def click_chunks_submenu
    click_submenu CHUNKS
  end

  def click_posh_body_submenu
    click_submenu POSH_BODY
  end

  def click_vegan_submenu
    click_submenu VEGAN
  end

  def click_face_masks_submenu
    click_submenu FACE_MASKS
  end

  private

  def click_submenu(submenu_item)
    hover find COLLECTIONS_LINK
    wait_for(5) { displayed? FACE_MASKS }
    click_on submenu_item
    ProductsPage.new @driver, false
  end
end