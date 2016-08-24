require 'selenium-webdriver'
require 'minitest/autorun'
require 'ramcrest'

class BaseTest < Minitest::Test

  PREFIX = 'vo-demo'
  ENV['base_url'] = 'http://' + PREFIX + '-g4p7lpmywlbys.us.platform.sh/p'

end