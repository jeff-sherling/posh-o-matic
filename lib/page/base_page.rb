require 'selenium-webdriver'
require 'selenium/webdriver/common/action_builder'
require 'selenium/webdriver/common/error'
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
    Console.log.info "Unable to find element.\n\t#{e.message}"
    raise Selenium::WebDriver::Error::NoSuchElementError
  end

  def find_elements(locator)
    Console.log.info "Locator array #{locator}"
    @driver.find_elements locator
  rescue Selenium::WebDriver::Error::NoSuchElementError => e
    Console.log.info "Unable to find element.\n\t#{e.message}"
    raise Selenium::WebDriver::Error::NoSuchElementError
  end

  # Clear text field
  def clear(locator)
    Console.log.info "Clearing text field (#{locator})"
    find(locator).clear
  end

  def alt_clear(locator)
    Console.log.info "Clearing text field via Ctrl + A, Delete (#{locator})"
    element = find locator
    element.send_keys(:control, 'a')
    element.send_keys(:delete)
  end

  # Type methods
  def type(locator, input)
    Console.log.info "Sending '#{input}' to #{locator}"
    find(locator).send_keys input
  end

  def js_type(locator, input)
    # For now, send locator, not a hash:
    # e.g., '#edit-mail', not {:css => "#edit-mail"}; TODO: extract locator
    Console.log.info "Sending '#{input}' to '#{locator}' via JS Execute."
    element = find locator
    js_string = "document.querySelector('" + element + "').setAttribute(
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
    Console.log.info "Is displayed? #{locator}"
    rescue_exceptions { @driver.find_element(locator).displayed? }
  end

  def enabled?(locator)
    Console.log.info "Is enabled? #{locator}"
    rescue_exceptions { @driver.find_element(locator).enabled? }
  end

  def selected?(locator)
    Console.log.info "Is selected? #{locator}"
    rescue_exceptions { @driver.find_element(locator).selected? }
  end

  def rescue_exceptions
    yield
  rescue Selenium::WebDriver::Error::NoSuchElementError => e
    Console.log.info "Unable to find element.\n\t#{e.message}"
    false
  rescue Selenium::WebDriver::Error::StaleElementReferenceError => e
    Console.log.info "Element is stale.\n\t#{e.message}"
    false
  end

  def text_of(locator)
    element_text = find(locator).text
    Console.log.info "Element text of #{locator} is:\n\t #{element_text}"
    element_text
  end

  def page_title
    page_title = @driver.title
    Console.log.info "Page title: #{page_title}"
    page_title
  end

  def page_url
    Console.log.info "Page URL: #{driver.current_url}"
    @driver.current_url
  end

  def select_dropdown(locator, option, method = :value)
    Console.log.info "Selecting field: #{locator} \n\toption: #{option}
      select method: #{method}"
    select_list = Selenium::WebDriver::Support::Select.new(find(locator))
    select_list.select_by(method, option)
  end

  def wait_for(seconds = 30)
    Console.log.info "Explicit wait up to #{seconds} seconds for..."
    Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
  end

  def hover(locator)
    Console.log.info "Hovering over #{locator}"
    @driver.action.move_to(locator).perform
  end
end