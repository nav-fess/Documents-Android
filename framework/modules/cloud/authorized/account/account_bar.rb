# frozen_string_literal: true

# PageObject for CloudFileList
class AccountBar < BasePageObject
  button 'delete_account', id: 'deleteSelected'
  button 'more', xpath: '//android.widget.ImageView[@content-desc="More options"]'
  button 'select_all', xpath: '//android.widget.LinearLayout[@index="0"]'
  button 'deselect', xpath: '//android.widget.LinearLayout[@index="1"]'
end
