$:.push '../lib/page'
require 'footer_sub_menu'
require_relative 'base_test'

class FooterSubMenuTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @sub_menu = FooterSubMenu.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_careers_link
    careers = @sub_menu.click_careers
    assert_includes(careers.get_title, 'Careers', 'Not on Posh Careers page.')
  end

  def test_terms_conditions_link
    terms = @sub_menu.click_terms_conditions
    assert_includes(terms.get_title, 'Terms and Conditions', 'Not on Terms page.')
  end

  def test_privacy_policy_link
    privacy = @sub_menu.click_privacy_policy
    assert_includes(privacy.get_title, 'Privacy Policy', 'Not on Privacy Policy page.')
  end

  def test_copyright_year_is_current
    assert_includes(@sub_menu.get_copyright, Time.new.year.to_s, 'Copyright year should be current.')
  end

end