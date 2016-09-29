require 'base_page'

class CareersPage < BasePage
  PAGE_URL = '/careers'

  INTERESTED_JOINING_TEAM = { :css => '.side-margins:nth-of-type(2) h2' }

  def initialize(driver, nav = true)
    super(driver)
    visit(PAGE_URL) if nav
    wait_for { displayed?(INTERESTED_JOINING_TEAM) }
  end

  def get_page_heading_text
    find(INTERESTED_JOINING_TEAM).text
  end

end