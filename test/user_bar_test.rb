$LOAD_PATH.push 'lib/page'
require_relative 'base_test'
require 'user_bar'

# Test User bar
class UserBarTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @user = UserBar.new @driver
  end

  def teardown
    @driver.quit
  end

  def test_anonymous_become_consultant_link
    join = @user.click_become_consultant
    assert(join.page_title.include?('Join'),
           'Page title should include Join.')
  end

  def test_anonymous_find_consultant_link
    find = @user.click_find_consultant
    assert(find.page_title.include?('Find a Consultant'),
           'Page title should include Find a Consultant.')
  end

  def test_anonymous_no_referral_link
    assert(!@user.referral_link_present?, 'Referral Link should not be present.')
  end
end