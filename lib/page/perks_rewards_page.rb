require 'base_page'
require 'get_started_page'

class PerksRewardsPage < BasePage
  PAGE_URL = '/perks-rewards'

  GET_PERKY_WITH_US = { :css => ".hidden-xs a[href='/start']" }
  GET_STARTED = { :css => 'a.perks-btn' }
  EARN_BOX = { :css => '.earn-box' }
  FAQ_LINK = { :css => 'a.faq-link' }
  REDEEM_BOX = { :css => '.redeem-box'}
  FAQ_HEADING = { :id => 'faq'}
  TERMS_HEADING = { :css => '.terms-h1 a' }

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed? GET_PERKY_WITH_US }
  end

  def click_get_started
    click_on GET_STARTED
    GetStartedPage.new(driver, false)
  end

  def get_started_count
    find_elements(GET_STARTED).size
  end

  def get_earn_box_count
    find_elements(EARN_BOX).size
  end

  def get_faq_link_count
    find_elements(FAQ_LINK).size
  end

  def get_redeem_box_count
    find_elements(REDEEM_BOX).size
  end

  def faq_heading_present?
    wait_for(5) { displayed? FAQ_HEADING }
  end

  def terms_heading_present?
    wait_for(5) { displayed? TERMS_HEADING}
  end

end