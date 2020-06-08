# frozen_string_literal: true

# PageObject for OneDrive
class OneDrive < BasePageObject
  button 'item_one_drive', xpath: "//android.view.ViewGroup[@index='2']"
  textfield 'login_one_drive', xpath: "//android.widget.EditText[@index='0']"
  button 'next_one_drive', xpath: "//android.widget.Button[@text='Next']"
  textfield 'pass_one_drive', xpath: "//android.widget.EditText[@index='0']"
  button 'sign_in_one_drive', xpath: "//android.widget.Button[@text='Sign in']"
  textfield 'name_one_drive', id: 'storage_connect_title_edit'
  button 'save_one_drive', xpath: "//android.widget.Button[@index='1']", delay: 3

  def self.add_account(account)
    item_one_drive_button_click                       if item_one_drive_button_wait
    login_one_drive_textfield_fill account[:login_st] if login_one_drive_textfield_wait
    next_one_drive_button_click                       if next_one_drive_button_wait
    pass_one_drive_textfield_fill account[:pass_st]   if pass_one_drive_textfield_wait
    sign_in_one_drive_button_click                    if sign_in_one_drive_button_wait
    name_one_drive_textfield_fill account[:storage]   if name_one_drive_textfield_wait
    save_one_drive_button_click                       if save_one_drive_button_wait
  end
end
