require 'base_page'
require 'privacy_policy_page'
require 'careers_page'
require 'terms_page'

class FooterSubMenu < BasePage
  PAGE_URL = '/'

  # Block 196 locators
  CAREERS = { :css => "a[href='/careers']" }
  TERMS_CONDITIONS = { :css => "a[href='/terms-conditions']" }
  PRIVACY_POLICY = { :css => "a[href='/privacy-policy']" }
  COPYRIGHT = { :css => 'p.copyright' }

  def initialize(driver, nav = true)
    super(driver)
    visit(PAGE_URL) if nav
    wait_for { displayed?(CAREERS) }
  end

  def get_copyright
    text_of(COPYRIGHT)
  end

  def click_privacy_policy
    click_on PRIVACY_POLICY
    PrivacyPolicyPage.new(@driver, false)
  end

  def click_careers
    click_on CAREERS
    CareersPage.new(@driver, false)
  end

  def click_terms_conditions
    click_on TERMS_CONDITIONS
    TermsPage.new(@driver, false)
  end

end