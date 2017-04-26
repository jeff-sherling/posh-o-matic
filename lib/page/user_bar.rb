require 'base_page'
require 'join_page'
require 'find_consultant_page'

# User bar component (My Account, Cart icon, etc.)
class UserBar < BasePage
  PAGE_URL = '/'.freeze

  # Locators
  BECOME_A_POSH_CONSULTANT = { css: "#block-block-246 a[href='/join']" }.freeze
  FIND_CONSULTANT = { css: "#block-block-246 a[href='/find']" }.freeze
  REFERRAL_LINK = { id: 'perks-referral-button' }.freeze
  MY_ACCOUNT = { css: "#myaccount--link[href$='/vo']" }.freeze
  CART_QUANTITY = { css: '.cart-qty' }.freeze

  # MY ACCOUNT sub-menu items
  LOGOUT = { css: "#my-account-menu-mobile a[href$='/user/logout']" }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for(10) { displayed?MY_ACCOUNT }
  end

  def referral_link_present?
    displayed? REFERRAL_LINK
  end

  def find_consultant_link_present?
    displayed?FIND_CONSULTANT
  end

  def become_consultant_link_present?
    displayed? BECOME_A_POSH_CONSULTANT
  end

  def click_become_consultant
    click_on BECOME_A_POSH_CONSULTANT
    JoinPage.new @driver, false
  end

  def click_find_consultant
    click_on FIND_CONSULTANT
    FindConsultantPage.new @driver, false
  end

  def log_out
    click_on MY_ACCOUNT
    wait_for(5) { displayed?LOGOUT }
    click_on LOGOUT
  end

  def cart_quantity
    text_of CART_QUANTITY
  end
end