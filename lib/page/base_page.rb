require 'selenium-webdriver'
require 'selenium/webdriver/common/action_builder'
$LOAD_PATH.push 'lib/log'
require 'console'

# Selenium actions performed on elements
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
    @driver.find_element locator
  rescue Selenium::WebDriver::Error::NoSuchElementError => e
    Console.log.info "Unable to find #{locator}\n\t#{e.message}"
    raise NoSuchElementError
  end

  def find_elements(locator)
    # Returns array of elements matching locator
    Console.log.info "Locator array #{locator}"
    @driver.find_elements locator
  rescue Selenium::WebDriver::Error::NoSuchElementError => e
    Console.log.info "Unable to find #{locator}\n\t#{e.message}"
    raise Selenium::WebDriver::Error::NoSuchElementError
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

  # Type methods
  def type(locator, input)
    Console.log.info "Sending '#{input}' to #{locator}"
    find(locator).send_keys input
  end

  def js_type(locator, input)
    # For now, send locator, not a hash:
    # e.g., '#edit-mail', not {:css => "#edit-mail"}
    # TODO: extract locator from hash; behavior should match 'type' method
    Console.log.info "Sending '#{input}' to '#{locator}' via JS Execute."
    js_string = "document.querySelector('" + locator.to_s + "').setAttribute(
      'value', '" + input.to_s + "');"
    @driver.execute_script(js_string)
  end

  # Click methods
  def click_on(locator)
    Console.log.info "Clicking #{locator}"
    find(locator).click
  end

  def click_action(locator)
    Console.log.info "Clicking (Action) #{locator}"
    @driver.action.click(locator).perform
  end

  def displayed?(locator)
    if @driver.find_element(locator).displayed?
      true
    else
      false
    end
  end

  def enabled?(locator)
    if @driver.find_element(locator).enabled?
      true
    else
      false
    end
  end

  def text_of(locator)
    element_text = find(locator).text
    Console.log.info "Getting element text #{element_text}"
    element_text
  end

  def page_title
    page_title = driver.title
    Console.log.info "Getting title #{page_title}"
    page_title
  end

  def page_url
    Console.log.info "Getting URL #{driver.current_url}"
    driver.current_url
  end

  def select_dropdown(locator, option, method = :value)
    Console.log.info "Selecting field: #{locator} \n\toption: #{option}
      \n\t select method: #{method}"
    web_element = driver.find_element(locator)
    select_list = Selenium::WebDriver::Support::Select.new(web_element)
    select_list.select_by(method, option)
  end

  def wait_for(seconds = 30)
    Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
  end

  def hover(locator)
    Console.log.info "Hovering over #{locator}"
    @driver.action.move_to(locator).perform
  end
end