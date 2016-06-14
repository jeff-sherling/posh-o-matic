$:.push '../page'
require 'selenium-webdriver'

class BasePage
  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end

  # Visit page URL; ENV is defined in test file
  def visit(url = '/')
    @driver.get(ENV['base_url'] + url)
  end

  def find(locator)
    @driver.find_element locator
  end

  # Returns array of elements matching locator
  def find_elements(locator)
    @driver.find_elements locator
  end

  # Clear text field
  def clear(locator)
    find(locator).clear
  end

  def type(locator, input)
    find(locator).send_keys input
  end

  def click_on(locator)
    find(locator).click
  end

  def displayed?(locator)
    @driver.find_element(locator).displayed?
    true
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
  end

  def text_of(locator)
    find(locator).text
  end

  def title
    @driver.title
  end

  def get_url
    @driver.current_url
  end

  # TODO: 'method' is overloaded term
  def select_dropdown(locator, option, method=:value)
    web_element = @driver.find_element(locator)
    select_list = Selenium::WebDriver::Support::Select.new(web_element)
    select_list.select_by(method, option)
  end

  def wait_for(seconds=30)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
  end

end