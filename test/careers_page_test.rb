$LOAD_PATH.push 'lib/page'
require_relative 'base_test'
require 'careers_page'

# Test Careers page
class CareersPageTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @careers = CareersPage.new @driver
  end

  def teardown
    @driver.quit
  end

  def test_page_title
    assert(@careers.page_title.include?('Careers'),
           'Page title should include Careers.')
  end

  def test_click_meet_team_link
    meet_team = @careers.click_meet_team_link
    assert(meet_team.page_title.include?('Meet The Team'),
           'Page title should include Meet The Team.')
  end

  def test_page_headings_count
    assert_equal(3, @careers.page_headings_count,
                 'Should be three page headings.')
  end
end