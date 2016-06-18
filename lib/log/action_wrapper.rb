$:.push '../lib/log'
require 'selenium-webdriver'
require 'test_logger'

class ActionWrapper < Selenium::WebDriver::Support::AbstractEventListener

  def after_navigate_to

  end

  def before_navigate_to(url)
    TestLogger.log.info "Navigating to #{url}."
  end

  def before_click(locator, driver)
    element = driver.find_element(locator)
    TestLogger.log.info "Clicking on #{element.text}"
  end

  def after_click

  end

  def before_find

  end

  def after_find

  end

  private

  def log

  end

end