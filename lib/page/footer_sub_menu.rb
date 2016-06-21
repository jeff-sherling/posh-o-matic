require 'base_page'

class FooterSubMenu < BasePage

  # Block 196 locators
  CAREERS = { :css => "a[href='/careers']" }
  TERMS_CONDITIONS = { :css => "a[href='/terms-conditions']" }
  PRIVACY_POLICY = { :css => "a[href='/privacy-policy']" }
  COPYRIGHT = { :css => "p.copyright" }

  def initialize(driver)
    super(driver)
    wait_for { displayed?(CAREERS) }
  end


end