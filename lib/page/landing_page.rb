require 'base_page'
require 'console'

class LandingPage < BasePage
  PAGE_URL = '/'

  LANDING_PAGE = { :css => '.front.not-logged-in.not-virtualoffice' }

  def initialize(driver)
    super(driver)
    visit PAGE_URL
    Console.log.info 'Waiting on Landing page.'
    wait_for LANDING_PAGE
  end

  def is_present?
    wait_for { displayed?(LANDING_PAGE) }
  end

end