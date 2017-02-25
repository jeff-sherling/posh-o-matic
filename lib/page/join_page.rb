require 'base_page'

class JoinPage < BasePage
  PAGE_URL = '/join'

  TOP_JOIN_NOW_BTN = { :css => '.main-content > a' }
  JOIN_BTN = { :css => "a[href$='join/signup']" }

  def initialize(driver, nav = true)
    super(driver)
    visit(PAGE_URL) if nav
    wait_for { TOP_JOIN_NOW_BTN }
  end

  def top_join_btn_present?
    displayed? TOP_JOIN_NOW_BTN
  end

  def get_join_button_count
    find_elements(JOIN_BTN).size
  end

end