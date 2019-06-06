require 'base_page'
require_relative 'user_bar'
require_relative 'admin_menu'

# Admin menu component
class SummaryPage < BasePage
  PAGE_URL = '/vo'.freeze

  # Static Menu Locators
  TITLE = { css: 'h1.node-title' }.freeze
  YEAR_FILTER = { css: "select[name='sales_year']" }.freeze
  MONTH_FILTER = { css: "select[name='sales_month']" }.freeze
  APPLY_BTN = { css: '.form-item button.btn' }.freeze

  SUMMARY_CHART_LEGEND = { css: '#chart-legend' }.freeze
  MY_GOALS_WIDGET = { css: '.vo-widget--my-goals' }.freeze
  LATEST_ORDERS_WIDGET = { css: '.vo-widget--latest-orders' }.freeze
  NEW_TO_TEAM_WIDGET = { css: '.vo-widget--new-consultants' }.freeze
  COMMISSIONS_WIDGET = { css: '.vo-widget--commissions' }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed? SUMMARY_CHART_LEGEND}
  end

  def orders_widget_present?
    find_element LATEST_ORDERS_WIDGET
  end

  private
    def click_submenu(menu, submenu_item)
      hover find menu
      click_on submenu_item
    end
end

