$:.push '../lib/log'
require 'selenium-webdriver'
require 'minitest/autorun'
require 'minitest/reporters'
require 'ramcrest'
require 'console'

class BaseTest < Minitest::Test

  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new, Minitest::Reporters::JUnitReporter.new]
  PREFIX = 'feature-spring-lqw5hlq'
  ENV['base_url'] = 'http://' + PREFIX + '-g4p7lpmywlbys.us.platform.sh/p'

end