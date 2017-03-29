# $LOAD_PATH.push 'lib/page'
require 'base_page'

# Social section of footer (Facebook, etc.)
class FooterSocial < BasePage
  PAGE_URL = '/'.freeze

  # Social locators
  FACEBOOK = { css: "a[href*='facebook']" }.freeze
  TWITTER = { css: "a[href*='twitter']" }.freeze
  INSTAGRAM = { css: "a[href*='instagram']" }.freeze
  PINTEREST = { css: "a[href*='pinterest']" }.freeze
  YOUTUBE = { css: "a[href*='youtube']" }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit(PAGE_URL) if nav
    wait_for { COPYRIGHT }
  end
end