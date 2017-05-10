$LOAD_PATH.push 'lib/page'
$LOAD_PATH.push 'lib/data'
require_relative 'base_test'
require 'join_signup_step1'
require 'join_signup_step2'
require 'consultant'

# Test Step 2 of Join Signup form
class JoinSignupStep2Test < BaseTest
  def setup
    @driver = Selenium::WebDriver.for BROWSER
    @signup1 = JoinSignupStep1.new(@driver)
    @consultant = Consultant.new.valid_consultant
    puts @consultant
  end

  def teardown
    @driver.quit
  end

  def test_find_sponsor_fields_present_for_anonymous
    signup2 = @signup1.submit_valid @consultant
    assert(signup2.sponsor_name_present? &&
               signup2.sponsor_name_submit_present? &&
               signup2.sponsor_zip_code_present? &&
               signup2.sponsor_zip_submit_present?,
           'Four find sponsor elements should be displayed.')
  end

  def test_starter_kit_element_present
    signup2 = @signup1.submit_valid @consultant
    assert(signup2.starter_kit_present?,
           'Starter kit element should be present.')
  end

  def test_sponsor_element_present_for_rep_site
    rep_site = @driver.current_url.sub('/p/', '/HEATHER/')
    @driver.get rep_site
    signup2 = @signup1.submit_valid @consultant
    assert(signup2.rep_sponsor_present?,
           'Sponsor component should be present.')
  end
end