$LOAD_PATH.push 'lib/page'
require_relative 'base_test'
require 'meet_the_team_page'

# Test Meet the Team page
class MeetTheTeamPageTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for BROWSER
    @meet = MeetTheTeamPage.new @driver
  end

  def teardown
    @driver.quit
  end

  def test_executive_bio_heading_count
    assert(@meet.executive_heading_count >= 1,
           'Should be at least one executive listed.')
  end

  def test_join_team_link_redirect
    careers = @meet.click_join_team_link
    assert(careers.page_title.include?('Careers'),
           'Page title should include Careers.')
  end
end