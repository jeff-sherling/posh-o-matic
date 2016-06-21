$:.push '../lib/page'
require 'footer_social'
require_relative 'base_test'

class FooterTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @footer = FooterSocial.new(@driver)
  end

  def teardown
    @driver.quit
  end

end