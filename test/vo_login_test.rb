$LOAD_PATH.push 'lib/vo'
require 'login_page'
require 'summary_page'
require_relative 'base_test'

# Test Login page.
class VoLoginTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for BROWSER
    @login_page = LoginPage.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_consultant_can_login_and_logout
    summary = @login_page.valid_login('jeff.sherling@perfectlyposh.com', 'Allen-25536')
    # TODO: create summary page login/logout methods; unable to find any page elements
    assert(summary.orders_widget_present?, 'Unable to find Latest Orders widget.')
    @login_page = user_bar.log_out
    #assert(user_bar.find_consultant_link_present?, 'User still logged in.')
  end
end
