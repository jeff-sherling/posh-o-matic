require 'selenium-webdriver'
require 'minitest/autorun'
require 'ramcrest'

class BaseTest < Minitest::Test

    ENV['base_url'] = 'http://virtual-office-g4p7lpmywlbys.us.platform.sh/p'

end