require 'selenium-webdriver'
require 'minitest/autorun'
require 'minitest/reporters'
require 'ramcrest'

class BaseTest < Minitest::Test

  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new, Minitest::Reporters::JUnitReporter.new]
  PREFIX = 'vo-demo'
  ENV['base_url'] = 'http://' + PREFIX + '-g4p7lpmywlbys.us.platform.sh/p'

end