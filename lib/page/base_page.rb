$:.push '../lib/page'
require 'selenium-webdriver'
$:.push '../lib/log'
require 'test_logger'

class BasePage
  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end

  def visit(url = '/')
    # Visit page URL; ENV is defined in test file
    TestLogger.log.info "Navigating to URL: #{url}."
    @driver.get(ENV['base_url'] + url)
  end

  def find(locator)
    @driver.find_element locator
  end

  def find_elements(locator)
    # Returns array of elements matching locator
    TestLogger.log.info "Getting locator array: #{locator}."
    @driver.find_elements locator
  end

  # Clear text field
  def clear(locator)
    TestLogger.log.info "Clearing: #{locator}."
    find(locator).clear
  end

  def type(locator, input)
    TestLogger.log.info "Sending: '#{input}' to: #{locator}."
    find(locator).send_keys input
  end

  def click_on(locator)
    TestLogger.log.info "Clicking: #{locator}."
    find(locator).click
  end

  def displayed?(locator)
    @driver.find_element(locator).displayed?
    true
    rescue Selenium::WebDriver::Error::NoSuchElementError
      TestLogger.log.info "Element not displayed: #{locator}."
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

  def select_dropdown(locator, option, method=:value)
    web_element = @driver.find_element(locator)
    select_list = Selenium::WebDriver::Support::Select.new(web_element)
    TestLogger.log.info "Select list: #{locator}; option: #{option}; method: #{method}"
    select_list.select_by(method, option)
  end

  def wait_for(seconds=30)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
  end

end