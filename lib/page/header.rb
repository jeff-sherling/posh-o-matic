$:.push '../lib/page'
require 'base_page'

class Header < BasePage

  # Public locators
  SITE_LOGO = { :css => 'a.site-logo' }

  PRODUCTS = { :css => '' }
  COLLECTIONS = { :css => '' }
  JOIN = { :css => '' }
  REWARDS = { :css => '' }
  ABOUT = { :id => 'edit-submit-solr-search' }

  SEARCH_BTN = { :css => '' }

  # Consultant locators
  INCENTIVE = { :css => '' }
  MY_BUSINESS = { :css => '' }
  PERKS = { :css => '' }
  EVENTS = { :css => '' }
  ORDERS = { :css => '' }
  ACADEMY = { :css => '' }
  BOX = { :css => '' }

  def initialize(driver)
    super(driver)
    wait_for { displayed?(SITE_LOGO) }
  end

end