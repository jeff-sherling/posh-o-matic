require 'base_page'
require 'privacy_policy_page'
require 'careers_page'
require 'terms_page'

# Submenu part of footer (Careers, Terms, etc.)
class FooterSubMenu < BasePage
  PAGE_URL = '/'.freeze

  # Block 196 locators
  CAREERS = { css: "a[href='/careers']" }.freeze
  TERMS_CONDITIONS = { css: "a[href='/terms-conditions']" }.freeze
  PRIVACY_POLICY = { css: "a[href='/privacy-policy']" }.freeze
  COPYRIGHT = { css: 'p.copyright' }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed?CAREERS }
  end

  def copyright
    text_of COPYRIGHT
  end

  def click_privacy_policy
    click_on PRIVACY_POLICY
    PrivacyPolicyPage.new@driver, false
  end

  def click_careers
    click_on CAREERS
    CareersPage.new@driver, false
  end

  def click_terms_conditions
    click_on TERMS_CONDITIONS
    TermsPage.new@driver, false
  end
end