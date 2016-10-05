require 'base_page'

class JoinPage < BasePage
  PAGE_URL = '/join'

  PAGE_HEADING = { :css => '.hero-section h2'}
  TOP_JOIN_NOW_BTN = { :css => '.hero-info-container > a.button.pink' }

  def initialize(driver, nav = true)
    super(driver)
    visit(PAGE_URL) if nav
    wait_for { TOP_JOIN_NOW_BTN }
  end

  def top_join_btn_present?
    displayed? TOP_JOIN_NOW_BTN
  end

end