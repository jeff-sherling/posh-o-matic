require 'base_page'
require 'careers_page'

# Executive Bios/Meet the Team (/meettheteam) page
class MeetTheTeamPage < BasePage
  PAGE_URL = '/meettheteam'.freeze

  # Locators
  PAGE_HEADING = { css: 'h2.pane-title > span' }.freeze
  JOIN_TEAM_LINK = { css: "a.join[href='/careers']" }.freeze
  EXECUTIVE_SUBHEADING = { css: 'h2.pink' }.freeze

  def initialize(driver, nav = true)
    @driver = driver
    visit PAGE_URL if nav
    wait_for(5) { displayed? PAGE_HEADING }
  end

  def click_join_team_link
    click_on JOIN_TEAM_LINK
    CareersPage.new @driver, false
  end

  def executive_heading_count
    find_elements(EXECUTIVE_SUBHEADING).size
  end
end