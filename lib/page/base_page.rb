require 'selenium-webdriver'
require 'selenium/webdriver/common/action_builder'
$:.push '../lib/log'
require 'console'

class BasePage
  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end

  def visit(url = '/')
    # Visit URL; ENV defined in BaseTest.rb
    Console.log.info "Navigating to #{ENV['base_url'] + url}"
    @driver.get(ENV['base_url'] + url)
  end

  def find(locator)
    begin
      @driver.find_element locator
    rescue Selenium::WebDriver::Error::NoSuchElementError
      Console.log.info "Unable to find #{locator}"
      raise NoSuchElementError
    end
  end

  def find_elements(locator)
    # Returns array of elements matching locator
    begin
      Console.log.info "Locator array #{locator}"
      @driver.find_elements locator
    rescue Selenium::WebDriver::Error::NoSuchElementError
      Console.log.info "Unable to find #{locator}"
      Selenium::WebDriver::Error::NoSuchElementError
    end
  end

  # Clear text field
  def clear(locator)
    Console.log.info "Clearing text field (#{locator})"
    find(locator).clear
  end

  def alt_clear(locator)
    Console.log.info "Clearing text field via Ctrl + A, Delete (#{locator})"
    @driver.send_keys(:control, 'a')
    @driver.send_keys(:delete)
  end

  def type(locator, input)
    Console.log.info "Sending '#{input}' to #{locator}"
    find(locator).send_keys input
  end

  def js_type(locator, input)
    # For now, send locator, not a hash; e.g., '#edit-mail', not {:css => "#edit-mail"}
    # TODO: extract locator from hash; behavior should match 'type' method
    Console.log.info "Sending '#{input}' to '#{locator}' via JS Execute."
    js_string = "document.querySelector('" + locator.to_s + "').setAttribute('value', '" + input.to_s + "');"
    @driver.execute_script(js_string)
  end

  def click_on(locator)
    Console.log.info "Clicking #{locator}"
    find(locator).click
  end

  def click_action(locator)
    Console.log.info "Clicking (Action) #{locator}"
    @driver.action.click(locator).perform
  end

  def displayed?(locator)
    begin
      @driver.find_element(locator).displayed?
      true
    rescue Selenium::WebDriver::Error::NoSuchElementError
      Console.log.info "Element not displayed: #{locator}"
      false
    end
  end

  def text_of(locator)
    element_text = find(locator).text
    Console.log.info "Getting element text #{element_text}"
    element_text
  end

  def get_title
    page_title = @driver.title
    Console.log.info "Getting title #{page_title}"
    page_title
  end

  def get_url
    Console.log.info "Getting URL #{@driver.current_url}"
    @driver.current_url
  end

  def select_dropdown(locator, option, method=:value)
    Console.log.info "Select field: #{locator} \n\toption: #{option} \n\t select method: #{method}"
    web_element = @driver.find_element(locator)
    select_list = Selenium::WebDriver::Support::Select.new(web_element)
    select_list.select_by(method, option)
  end

  def wait_for(seconds=30)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
  end

end