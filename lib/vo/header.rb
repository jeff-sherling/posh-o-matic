require 'base_page'
require_relative 'summary_page'

# User bar component (My Account, Home icon, etc.)
class Header < BasePage
  PAGE_URL = '/'.freeze

  # Locators
  POSH_ICON = { css: 'a.site-logo' }.freeze
  VO_HOME = { css: '#menu-238509-2 a' }.freeze
  POSH_ACADEMY = { css: "#myaccount--link[href$='/vo']" }.freeze

  def initialize(driver)
    super(driver)
    wait_for(10) { displayed?POSH_ICON }
  end

  def click_posh_logo
    click_on POSH_ICON
    SummaryPage.new @driver
  end

  def click_vo_home
    click_on VO_HOME
    SummaryPage.new @driver
  end
end
