$:.push '../lib/page'
require 'base_page'

class UserBar < BasePage

  # Locators
  # Logged in & public
  BECOME_CONSULTANT = { :css => ".block__top-consultant-menu a[href='/join']" }
  MY_ACCOUNT = { :id => 'myaccount--link' }
  CART_LINK = { :css => "#block-posh-cart-notifications-cart-notifications-nav a[href$='/cart']" }
  CART_QUANTITY = { :css => '.fa-shopping-cart > .cart-qty' }

  # Logged in only
  REFERRAL_LINK = { :id => 'perks-referral-button' }

  # Public only
  FIND_CONSULTANT = { :css => ".block__top-consultant-menu a[href='/find']" }

  def initialize(driver)
    super(driver)
    wait_for(10) { displayed?(MY_ACCOUNT) }
  end

  def is_referral_link_present?
    wait_for(5) { displayed?(REFERRAL_LINK) }
  end

  def get_cart_count
    text_of CART_QUANTITY
  end

  def log_out
    click_on MY_ACCOUNT
  end

end