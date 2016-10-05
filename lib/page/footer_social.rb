$:.push '../lib/page'
require 'base_page'

class FooterSocial < BasePage
  PAGE_URL = '/'

  # Social locators
  FACEBOOK = { :css => "a[href*='facebook']"}
  TWITTER = { :css => "a[href*='twitter']"}
  INSTAGRAM = { :css => "a[href*='instagram']"}
  PINTEREST = { :css => "a[href*='pinterest']"}
  YOUTUBE = { :css => "a[href*='youtube']"}

  def initialize(driver, nav = true)
    super(driver)
    visit(PAGE_URL) if nav
    wait_for { COPYRIGHT }
  end



end