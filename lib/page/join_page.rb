require 'base_page'

# Join (/join) page
class JoinPage < BasePage
  PAGE_URL = '/join'.freeze

  TOP_JOIN_NOW_BTN = { css: '.main-content > a' }.freeze
  JOIN_BTN = { css: "a[href$='join/signup']" }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { TOP_JOIN_NOW_BTN }
  end

  def top_join_btn_present?
    displayed? TOP_JOIN_NOW_BTN
  end

  def join_button_count
    find_elements(JOIN_BTN).size
  end
end