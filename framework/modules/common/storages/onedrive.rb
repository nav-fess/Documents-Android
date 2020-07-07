# frozen_string_literal: true

# PageObject for OneDrive
class OneDrive < BasePageObject
  button 'item_one_drive', xpath: "//android.view.ViewGroup[@index='2']"
  textfield 'login_one_drive', xpath: "//android.widget.EditText[@index='0']"
  button 'next_one_drive', xpath: "//android.widget.Button[@text='Next']"
  textfield 'pass_one_drive', xpath: "//android.widget.EditText[@index='0']"
  button 'sign_in_one_drive', xpath: "//android.widget.Button[@text='Sign in']"
  textfield 'name_one_drive', id: 'storage_connect_title_edit'
  button 'save_one_drive', xpath: "//android.widget.Button[@index='1']"

  def self.add_storage(account)
    item_one_drive_button_click                                 if item_one_drive_button_wait
    login_one_drive_textfield_fill account[:login], delay: 3    if login_one_drive_textfield_wait
    next_one_drive_button_click                                 if next_one_drive_button_wait
    pass_one_drive_textfield_fill account[:pass]                if pass_one_drive_textfield_wait
    sign_in_one_drive_button_click                              if sign_in_one_drive_button_wait
    name_one_drive_textfield_fill account[:name]                if name_one_drive_textfield_wait
    save_one_drive_button_click delay: 3                        if save_one_drive_button_wait
  end
end
