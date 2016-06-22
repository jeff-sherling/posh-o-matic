$:.push '../lib/page'
require_relative 'base_test'
require 'ingredients_page'

class IngredientsPageTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @ingredients = IngredientsPage.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_ingredients_headers_match_buttons
    assert(@ingredients.get_ingredients_headers_count ==
               @ingredients.get_view_products_btn_count,
           'Ingredients headers count does not match number of View Products buttons.')
  end

  def test_skip_intro_btn_links_to_ingredients_section
    @ingredients.skip_intro
    assert(@ingredients.get_url.include?('#ingredients'),
           'Skip Intro button not linking to Ingredients section.')
  end

  def test_title_includes_ingredients_page
    assert(@ingredients.title.include?('Ingredients Page'), 'Page title should include Ingredients')
  end

end