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
    item_one_drive_button_click                     delay: 3, time: 2
    login_one_drive_textfield_fill account[:login], delay: 3, time: 2
    next_one_drive_button_click                     delay: 3, time: 2
    pass_one_drive_textfield_fill account[:pass], delay: 3, time: 2
    sign_in_one_drive_button_click delay: 3, time: 2
    name_one_drive_textfield_fill account[:name], delay: 3, time: 2
    save_one_drive_button_click                   delay: 3, time: 2
  end
end
