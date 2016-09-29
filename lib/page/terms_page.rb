require 'base_page'

class TermsPage < BasePage
  PAGE_URL = '/terms-conditions'

  PAGE_HEADING = { :css => 'h2.pane-title' }

  def initialize(driver, nav = true)
    super(driver)
    visit(PAGE_URL) if nav
    wait_for { displayed?(PAGE_HEADING) }
  end

end