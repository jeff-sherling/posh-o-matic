require 'base_page'

# Header component (products, collections, etc.)
class Header < BasePage
  # Public locators
  SITE_LOGO = { css: 'a.site-logo' }.freeze

  PRODUCTS = { css: '' }.freeze
  COLLECTIONS = { css: '' }.freeze
  JOIN = { css: '' }.freeze
  REWARDS = { css: '' }.freeze
  ABOUT = { id: 'edit-submit-solr-search' }.freeze

  SEARCH_BTN = { css: '' }.freeze

  # Consultant locators
  INCENTIVE = { css: '' }.freeze
  MY_BUSINESS = { css: '' }.freeze
  PERKS = { css: '' }.freeze
  EVENTS = { css: '' }.freeze
  ORDERS = { css: '' }.freeze
  ACADEMY = { css: '' }.freeze
  BOX = { css: '' }.freeze

  def initialize(driver)
    super(driver)
    wait_for { displayed?SITE_LOGO }
  end
end