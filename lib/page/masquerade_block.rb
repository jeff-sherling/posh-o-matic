require 'base_page'

# Masquerade block that appears for admin users on most pages
class MasqueradeBlock < BasePage
  # Selector string
  switch_back = "#quick_switch_links a[href*='/masquerade/unswitch']"

  # Masquerade as...
  MASQUERADE_BOX = { id: 'edit-masquerade-user-field' }.freeze
  AUTO_COMPLETE_FIELD = { id: 'edit-masquerade-user-field-autocomplete' }.freeze
  GO_BUTTON = { id: 'edit-submit--15' }.freeze

  # Switch back
  EMAIL_LINK = { css: "#masquerade-block-1 a[href*='/users/']" }.freeze
  SWITCH_BACK = { css: switch_back }.freeze

  def initialize(driver)
    super(driver)
    wait_for(5) { displayed?(MASQUERADE_BOX) }
  end

  def masquerade(consultant)
    type(MASQUERADE_BOX, consultant)
    # select name from dropdown options
    click_on GO_BUTTON
  end
end