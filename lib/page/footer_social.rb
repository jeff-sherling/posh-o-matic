$:.push '../lib/page'
require 'base_page'

class FooterSocial < BasePage

  # Social locators
  FACEBOOK = { :css => "a[href*='facebook']"}
  TWITTER = { :css => "a[href*='twitter']"}
  INSTAGRAM = { :css => "a[href*='instagram']"}
  PINTEREST = { :css => "a[href*='pinterest']"}
  YOUTUBE = { :css => "a[href*='youtube']"}

  def initialize(driver)
    super(driver)
    wait_for { COPYRIGHT }
  end



end