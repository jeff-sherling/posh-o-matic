$LOAD_PATH.push 'lib/log'
require 'selenium-webdriver'
require 'minitest/autorun'
require 'minitest/reporters'
require 'ramcrest'
require 'console'

# Base class for UI tests.
class BaseTest < Minitest::Test
  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new,
                            Minitest::Reporters::JUnitReporter.new]

  # @driver = Selenium::WebDriver.for :chrome,
  # desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
  #   'chromeOptions' => {
  #     'args' => %w(--disable-infobars --disable-web-security)
  #   }
  # )
  BROWSER = :chrome
  CAPS = Selenium::WebDriver::Remote::Capabilities.chrome(
    'chromeOptions' => {
      'args' => %w(--disable-infobars --disable-web-security)
    }
  )

  # Test environments
  STAGE = 'http://stage.perfectlyposh.com.c.perfectlyposh.dev.ent.platform.sh'.freeze
  DEV = 'https://develop-g4p7lpmywlbys.us.platform.sh'.freeze
  test = 'core-7-5-4-xw3atza'
  CLOUD = "https://#{test}-g4p7lpmywlbys.us.platform.sh".freeze
  ENV['base_url'] = DEV
end