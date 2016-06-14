$:.push '../lib/page'
require 'base_page'

class Footer < BasePage
  PAGE_URL = '/'

  # Social locators
  FACEBOOK = { :css => "a[href*='facebook']"}
  TWITTER = { :css => "a[href*='twitter']"}
  INSTAGRAM = { :css => "a[href*='instagram']"}
  PINTEREST = { :css => "a[href*='pinterest']"}
  YOUTUBE = { :css => "a[href*='youtube']"}

  # Block 191 locators
  JOIN_POSH = { :css => "a[href='/join']" }
  CATALOG = { :css => "a[href='/sites/default/files/posh_paper_interactive.pdf']" }
  INGREDIENTS = { :css => "a[href='/ingredients']" }
  CUSTOMER_CARE = { :css => "a[href='/refund-policy']" }
  PHONE = { :css => "a[href='tel:+18014411744']" }

  # Block 196 locators
  CAREERS = { :css => "a[href='/careers']" }
  TERMS_CONDITIONS = { :css => "a[href='/terms-conditions']" }
  PRIVACY_POLICY = { :css => "a[href='/privacy-policy']" }
  COPYRIGHT = { :css => "p.copyright" }

  def initialize(driver)
    super(driver)
    visit(PAGE_URL)
    wait_for { COPYRIGHT }
  end

end