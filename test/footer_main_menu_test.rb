$:.push '../lib/page'
require_relative 'base_test'
require 'footer_main_menu'

class FooterMainMenuTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @footer = FooterMainMenu.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_join_posh_link
    join_page = @footer.click_join_posh
    assert(join_page.top_join_btn_present?, 'Join button not present.')
  end

  def test_ingredients_link
    ingredients = @footer.click_ingredients
    assert(ingredients.get_view_products_btn_count > 29, 'View Product button count is incorrect.')
  end

end