require 'base_page'

# Terms and Conditions (/terms-conditions) page.
class TermsPage < BasePage
  PAGE_URL = '/terms-conditions'.freeze

  PAGE_HEADING = { css: 'h2.pane-title' }.freeze
  ORDERED_LINE_ITEMS = { css: '.col-md-12 ol li' }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit(PAGE_URL) if nav
    wait_for { displayed?(PAGE_HEADING) }
  end

  def page_heading
    text_of PAGE_HEADING
  end

  def ordered_line_items
    find_elements(ORDERED_LINE_ITEMS).size
  end
end