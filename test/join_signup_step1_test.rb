$LOAD_PATH.push 'lib/page'
$LOAD_PATH.push 'lib/data'
require 'join_signup_step1'
require 'join_signup_step2'
require 'login_modal'
require 'consultant'
require_relative 'base_test'

# Test Step 1 (Your Info) of Join Signup form
class JoinSignupStep1Test < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @signup1 = JoinSignupStep1.new(@driver)
    @consultant = Consultant.new.valid_consultant
  end

  def teardown
    @driver.quit
  end

  def test_weak_password_strength
    assert(@signup1.get_password_strength == 'Weak',
           'Password strength should be Weak.')
  end

  def test_fair_password_strength
    fair = { password: 'abcdef' }
    assert(@signup1.get_password_strength(fair) == 'Fair',
           'Password strength should be Fair.')
  end

  def test_good_password_strength
    good = { password: 'abc123' }
    assert(@signup1.get_password_strength(good) == 'Good',
           'Password strength should be Good.')
  end

  def test_strong_password_strength
    strong = { password: 'abc!123' }
    assert(@signup1.get_password_strength(strong) == 'Strong',
           'Password strength should be Strong.')
  end

  def test_label_displays_yes_when_passwords_match
    match = { password: 'abc123', confirm_password: 'abc123' }
    assert(@signup1.passwords_match?(match),
           'Passwords Match label should display Yes.')
  end

  def test_label_displays_no_when_passwords_mismatched
    mismatch = { password: 'abc123', confirm_password: 'abc' }
    assert_equal(false, @signup1.passwords_match?(mismatch),
                 'Passwords Match label should display No.')
  end
end