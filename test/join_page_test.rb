$LOAD_PATH.push '../lib/page'
require_relative 'base_test'
require 'join_page'

# Join page tests.
class JoinPageTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @join = JoinPage.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_join_button_count
    assert(@join.get_join_button_count >= 3,
           'There should be 3 or more Join buttons.')
  end

  def test_page_title
    assert(@join.page_title.include?('Join'), 'Page title should include Join.')
  end
end