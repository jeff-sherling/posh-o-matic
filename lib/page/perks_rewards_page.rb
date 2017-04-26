require 'base_page'
require 'get_started_page'

# Perks Rewards (/perks-rewards) page
class PerksRewardsPage < BasePage
  PAGE_URL = '/perks-rewards'.freeze

  GET_STARTED_BTN = { css: ".perks-button a[href='/start']" }.freeze
  BANNER_CONTAINER = { css: "div[class$='banner-container']" }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed? GET_STARTED_BTN }
  end

  def banner_container_count
    find_elements(BANNER_CONTAINER).size
  end

  def click_get_started
    click_on GET_STARTED_BTN
    GetStartedPage.new(driver, false)
  end

  def started_button_count
    find_elements(GET_STARTED_BTN).size
  end
end