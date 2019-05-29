require 'base_page'

# Admin menu component
class AdminMenu < BasePage
  PAGE_URL = '/'.freeze

  # Selector strings
  posh_team_submenu = "#block-menu-menu-about-menu a[href$='/meettheteam']"

  # Static Menu Locators
  HOME_LOGO = { css: '#admin-menu-icon a.active-trail' }.freeze
  ORDERS = { css: "a[href='/admin/posh_orders/search']" }.freeze
  CONSULTANT_TAX_INFO = { css: "a[href='/admin/consultant/consultant-tax-info']" }.freeze
  DASHBOARD = { css: "a[href='/admin/dashboard']" }.freeze
  LOG_OUT = { css: "a[href='/user/logout']" }.freeze

  # Expandable menu locators
  CSR_MANAGER = { css: "a[href='/admin/consultants']" }.freeze
  # TODO: CSS selectors for remaining links
  CONTENT = { css: '' }.freeze
  STRUCTURE = { css: '' }.freeze
  APPEARANCE = { css: '' }.freeze
  PEOPLE = { css: '' }.freeze
  MODULES = { css: '' }.freeze
  CONFIGURATION = { css: '' }.freeze
  REPORTS = { css: '' }.freeze
  ISR_MANAGER = { css: '' }.freeze

  # Other locators
  SEARCH_BOX = { id: 'edit-search-api-views-fulltext' }.freeze
  SEARCH_BTN = { id: 'edit-submit-solr-search' }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed? HOME_LOGO }
  end

  def click_home_logo
    click_on POSH_LOGO
    # ?? LandingPage.new @driver, false
  end

  def products_submenu_visible?
    submenu_visible? PRODUCTS_LINK
  end

  def collections_submenu_visible?
    submenu_visible? COLLECTIONS_LINK
  end

  def about_submenu_visible?
    submenu_visible? ABOUT_LINK
  end

  private

    def submenu_visible?(locator)
      hover find locator
      enabled? SUBMENU
    end

    def click_submenu(menu, submenu_item)
      hover find menu
      click_on submenu_item
    end
end
