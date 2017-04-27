require 'base_page'

# Cancellation and Refund Policies (/refund-policy) page.
class CancelRefundPoliciesPage < BasePage
  PAGE_URL = '/refund-policy'.freeze

  # Locators
  PAGE_HEADING = { css: 'h2.pane-title' }.freeze
  SUBHEADING = { css: 'article strong' }.freeze
  PARAGRAPH = { css: 'article p' }.freeze
  ICONS = { css: "[class$='-icon']" }.freeze
  FACEBOOK_ICON = { css: '.facebook-icon' }.freeze
  PINTEREST_ICON = { css: '.pinterest-icon' }.freeze
  TWITTER_ICON = { css: '.twitter-icon' }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for(10) { displayed? ICONS }
  end

  def header_content
    text_of PAGE_HEADING
  end

  def bold_subheading_count
    find_elements(SUBHEADING).size
  end

  def paragraph_count
    find_elements(PARAGRAPH).size
  end

  def facebook_icon_present?
    displayed? FACEBOOK_ICON
  end

  def pinterest_icon_present?
    displayed? PINTEREST_ICON
  end

  def twitter_icon_present?
    displayed? TWITTER_ICON
  end
end