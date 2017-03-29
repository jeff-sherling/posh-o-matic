$LOAD_PATH.push '../lib/page'
require_relative 'base_test'
require 'ingredients_page'

# /ingredients tests.
class IngredientsPageTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @ingredients = IngredientsPage.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_ingredients_headers_match_buttons
    assert(@ingredients.ingredients_headers_count ==
               @ingredients.view_products_btn_count,
           "Ingredients headers doesn't match View Products buttons.")
  end

  def test_skip_intro_btn_links_to_ingredients_section
    @ingredients.skip_intro
    assert(@ingredients.page_url.include?('#ingredients'),
           'Skip Intro button not linking to Ingredients section.')
  end

  def test_title_includes_ingredients_page
    assert(@ingredients.title.include?('Ingredients Page'),
           'Page title should include Ingredients')
  end
end