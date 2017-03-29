require 'base_page'

class UserBar < BasePage

  # Logged in & public
  MY_ACCOUNT = { :css => "#myaccount--link[href$='/vo']" }
  CART_QUANTITY = { :css => '.cart-qty' }

  # Logged in only
  REFERRAL_LINK = { :id => 'perks-referral-button' }

  # Public only
  FIND_CONSULTANT = { :css => "a[href='/find']" }

  # MY ACCOUNT sub-menu items
  LOGOUT = { :css => ".mm-page a[href$='/user/logout']" }

  def initialize(driver)
    super(driver)
    wait_for(10) { displayed?(MY_ACCOUNT) }
  end

  def is_referral_link_present?
    wait_for(5) { displayed?(REFERRAL_LINK) }
  end

  def is_find_consultant_link_present?
    wait_for(5) { displayed?(FIND_CONSULTANT) }
  end

  def log_out
    click_on MY_ACCOUNT
    wait_for(5) { displayed?(LOGOUT) }
    click_on LOGOUT
  end

  def get_cart_quantity
    text_of CART_QUANTITY
  end

end