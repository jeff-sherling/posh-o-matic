require 'base_page'

# User bar component (My Account, Home icon, etc.)
class UserBar < BasePage
  PAGE_URL = '/'.freeze

  # Locators
  HOME_ICON = { css: "#block-block-246 a[href='/vo']" }.freeze
  MY_ACCOUNT = { css: "#myaccount--link[href$='/vo']" }.freeze

  # MY ACCOUNT sub-menu items
  LOGOUT = { css: "#my-account-menu-mobile a[href$='/user/logout']" }.freeze

  def initialize(driver) #, nav = true)
    super(driver)
    # visit PAGE_URL if nav
    wait_for(10) { displayed?MY_ACCOUNT }
  end

  def log_out_ui
    click_on MY_ACCOUNT
    wait_for(5) { displayed?LOGOUT }
    click_on LOGOUT
  end

  def log_out
    # TODO: get /user/logout
    wait_for(5) { displayed?LOGOUT }
  end
end
