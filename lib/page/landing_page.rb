require 'base_page'
require 'console'

# Main landing page
class LandingPage < BasePage
  PAGE_URL = '/'.freeze

  LANDING_PAGE = { css: '.front.not-virtualoffice' }.freeze
  PUBLIC_LANDING = { css: '.front.not-logged-in' }.freeze
  PRIVATE_LANDING = { css: '.front.logged-in' }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit PAGE_URL if nav
    wait_for { displayed?LANDING_PAGE }
  end

  # Viewed as Anonymous user
  def public_page?
    wait_for { displayed?PUBLIC_LANDING }
  end

  # Only viewed after login
  def logged_in?
    wait_for { displayed? PRIVATE_LANDING }
  end
end