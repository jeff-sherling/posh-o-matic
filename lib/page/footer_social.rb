require 'base_page'

# Social section of footer (Facebook, etc.)
class FooterSocial < BasePage
  PAGE_URL = '/'.freeze

  # Social locators
  SOCIAL_BLOCK_DIV = { id: 'block-block-186' }.freeze
  SOCIAL_ICONS_BLOCK = { css: '.block__social-icons a' }.freeze

  FACEBOOK = { css: ".block__social-icons a[href*='facebook']" }.freeze
  TWITTER = { css: ".block__social-icons a[href*='twitter']" }.freeze
  INSTAGRAM = { css: ".block__social-icons a[href*='instagram']" }.freeze
  PINTEREST = { css: ".block__social-icons a[href*='pinterest']" }.freeze
  YOUTUBE = { css: ".block__social-icons a[href*='youtube']" }.freeze

  def initialize(driver, nav = true)
    super(driver)
    visit(PAGE_URL) if nav
    wait_for { SOCIAL_BLOCK_DIV }
  end

  def social_icons_count
    find_elements(SOCIAL_ICONS_BLOCK).size
  end

  def twitter_link_present?
    displayed? TWITTER
  end

  def facebook_link_present?
    displayed? FACEBOOK
  end

  def instgram_link_present?
    displayed? INSTAGRAM
  end

  def pinterest_link_present?
    displayed? PINTEREST
  end

  def youtube_link_present?
    displayed? YOUTUBE
  end
end