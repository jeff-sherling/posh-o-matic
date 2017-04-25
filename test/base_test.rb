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

  STAGE = 'http://stage.perfectlyposh.com.c.perfectlyposh.dev.ent.platform.sh/p'.freeze
  DEV = 'https://develop-g4p7lpmywlbys.us.platform.sh/p'.freeze
  test = 'rc5-13-7-r4z24da'
  CLOUD = "https://#{test}-g4p7lpmywlbys.us.platform.sh/p".freeze
  ENV['base_url'] = DEV
end