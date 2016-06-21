require 'base_page'

class FooterMainMenu < BasePage

  # Block 191 locators
  JOIN_POSH = { :css => "a[href='/join']" }
  CATALOG = { :css => "a[href='/sites/default/files/posh_paper_interactive.pdf']" }
  INGREDIENTS = { :css => "a[href='/ingredients']" }
  CUSTOMER_CARE = { :css => "a[href='/refund-policy']" }
  PHONE = { :css => "a[href='tel:+18014411744']" }

  def initialize(driver)
    super(driver)
    wait_for { displayed?(JOIN_POSH) }
  end



end