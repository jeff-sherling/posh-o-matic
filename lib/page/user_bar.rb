$:.push '../lib/page'
require 'base_page'
#require 'landing_page'

class UserBar < BasePage

  # Logged in & public locators
  MY_ACCOUNT = { :id => 'myaccount--link' }

  # Logged in only locators
  REFERRAL_LINK = { :id => 'perks-referral-button' }

  # Public only locators
  FIND_CONSULTANT = { :css => "a[href='/find']" }

  # MY ACCOUNT submenu items
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
    #UserBar.new(driver)
  end

end