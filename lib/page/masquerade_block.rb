require 'base_page'

class MasqueradeBlock < BasePage

  # Locators
  MASQUERADE_BOX = { :id => 'edit-masquerade-user-field' }
  AUTO_COMPLETE_FIELD = { :id => 'edit-masquerade-user-field-autocomplete' }
  GO_BUTTON = { :id => 'edit-submit--15' }

  def initialize(driver)
    super(driver)
    wait_for(5) { displayed?(MASQUERADE_BOX) }
  end



end