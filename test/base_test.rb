$:.push '../lib/log'
require 'selenium-webdriver'
require 'minitest/autorun'
require 'minitest/reporters'
require 'ramcrest'
require 'console'

class BaseTest < Minitest::Test

  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new, Minitest::Reporters::JUnitReporter.new]

  STAGE = 'http://stage.perfectlyposh.com.c.perfectlyposh.dev.ent.platform.sh/p'
  DEV = 'https://develop-g4p7lpmywlbys.us.platform.sh/p'

  #PREFIX = 'feature-spring-lqw5hlq'
  #ENV['base_url'] = 'http://' + PREFIX + '-g4p7lpmywlbys.us.platform.sh/p'

  ENV['base_url'] = DEV

end