require 'base_page'
require 'test_logger'

class LandingPage < BasePage
  PAGE_URL = '/'

  LANDING_PAGE = { :css => '.front.not-logged-in.not-virtualoffice' }

  def initialize(driver)
    super(driver)
    visit PAGE_URL
    TestLogger.log.info 'Waiting Landing page.'
    wait_for LANDING_PAGE
  end

  def is_present?
    wait_for { displayed?(LANDING_PAGE) }
  end

end