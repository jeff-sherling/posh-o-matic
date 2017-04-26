require 'base_page'
require 'products_page'
require 'join_page'
require 'perks_rewards_page'
require 'company_about_page'
require 'landing_page'
require 'meet_the_team_page'

# Header component (products, collections, etc.)
class Header < BasePage
  PAGE_URL = '/'.freeze

  # Selector strings
  rewards_link = "#superfish-2 a.sf-depth-1[href$='/perks-rewards']"
  posh_team_submenu = "#block-menu-menu-about-menu a[href$='/meettheteam']"

  # Locators
  POSH_LOGO = { css: 'a.site-logo' }.freeze
  PRODUCTS_LINK = { css: '#superfish-2 #shop-product-categories' }.freeze
  SUBMENU = { css: '.views-row a' }.freeze
  COLLECTIONS_LINK = { css: '#superfish-2 #shop-posh-collections' }.freeze

  JOIN_LINK = { css: "#superfish-2 a.sf-depth-1[href$='/join']" }.freeze
  REWARDS_LINK = { css: rewards_link }.freeze
  ABOUT_LINK = { css: '#superfish-2 #main-nav-about' }.freeze
  POSH_TEAM_ABOUT_SUBMENU = { css: posh_team_submenu }.freeze

  SEARCH_BOX = { id: 'edit-search-api-views-fulltext' }.freeze
  SEARCH_BTN = { id: 'edit-submit-solr-search' }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed?POSH_LOGO }
  end

  def click_posh_logo
    click_on POSH_LOGO
    LandingPage.new @driver, false
  end

  def click_products_link
    click_on PRODUCTS_LINK
    ProductsPage.new @driver, false
  end

  def click_collections_link
    click_on COLLECTIONS_LINK
    ProductsPage.new @driver, false
  end

  def click_join_link
    click_on JOIN_LINK
    JoinPage.new @driver, false
  end

  def click_rewards_link
    click_on REWARDS_LINK
    PerksRewardsPage.new @driver, false
  end

  def click_about_link
    click_on ABOUT_LINK
    CompanyAboutPage.new @driver, false
  end

  def click_about_posh_team_submenu
    click_submenu ABOUT_LINK, POSH_TEAM_ABOUT_SUBMENU
    MeetTheTeamPage.new @driver, false
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