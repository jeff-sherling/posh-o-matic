$:.push '../lib/page'
require 'footer'
require_relative 'base_test'

class FooterTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @footer = Footer.new(@driver)
  end

  def teardown
    @driver.quit
  end

end