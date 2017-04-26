$LOAD_PATH.push 'lib/data'
$LOAD_PATH.push 'lib/log'
require 'user_factory'
require 'minitest/autorun'
require 'minitest/reporters'
require 'console'

# UserFactory address-related unit tests
class UserFactoryAddressTest < Minitest::Test
  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new,
                            Minitest::Reporters::JUnitReporter.new]

  def test_phone
    phone = UserFactory.phone
    Console.log.info "Phone: #{phone}"
    assert(phone.size == 10, 'Phone should be 10 characters long.')
  end

  def test_address1
    address = UserFactory.address1
    Console.log.info "Address 1: #{address}"
    assert(address.size >= 10,
           'Address1 size should be 10 characters or longer.')
  end

  def test_address2
    room = UserFactory.address2
    Console.log.info "Address 2: #{room}"
    assert(room.size >= 5, 'Address2 should be 5 characters or longer.')
  end

  def test_state
    state = UserFactory.state_province
    Console.log.info "State: #{state}"
    assert(state.size == 2, 'State should be two-letter abbreviation.')
  end
end