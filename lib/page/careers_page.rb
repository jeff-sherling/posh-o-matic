require 'base_page'
require 'meet_the_team_page'

# Careers (/careers) page
class CareersPage < BasePage
  PAGE_URL = '/careers'.freeze

  # Locators
  PAGE_HEADINGS = { css: 'h2.pane-title' }.freeze
  MEET_TEAM_LINK = { css: "a.join[href='/meettheteam']" }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit(PAGE_URL) if nav
    wait_for { displayed?(PAGE_HEADINGS) }
  end

  def click_meet_team_link
    click_on MEET_TEAM_LINK
    MeetTheTeamPage.new @driver
  end

  def page_headings_count
    find_elements(PAGE_HEADINGS).size
  end
end