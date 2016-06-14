$:.push '../lib/page'
require 'ingredients'
require_relative 'base_test'

class IngredientsTest < BaseTest

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @ingredients = Ingredients.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_ingredients_headers_match_buttons
    assert(@ingredients.get_ingredients_headers_count ==
               @ingredients.get_view_products_btn_count,
           'Number of Ingredients page headers does not match View Products buttons.')
  end

  def test_skip_intro_btn_links_to_ingredients_section
    @ingredients.skip_intro
    assert(@ingredients.get_url.include?('#ingredients'),
           'Skip Intro button not linking to Ingredients section.')
  end

end