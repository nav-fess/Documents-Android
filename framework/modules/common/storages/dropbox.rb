# frozen_string_literal: true

# PageObject for Dropbox
class Dropbox < BasePageObject
  button 'item_dropbox', xpath: "//android.view.ViewGroup[@index='1']"
  button 'sing_in_with_google', xpath: "//android.widget.Button[@index='0']"
  textfield 'login_google', xpath: "//android.widget.EditText[@index='0']"
  button 'next_google_login', xpath: "//android.widget.Button[@text='Next']"
  textfield 'pass_google', xpath: "//android.widget.EditText[@index='0']"
  button 'next_google', xpath: "//android.widget.Button[@text='Next']"
  textfield 'name_dropbox', id: 'storage_connect_title_edit'
  button 'save_dropbox', id: 'storage_connect_save'

  def self.add_account(account)
    item_dropbox_button_click                                if item_dropbox_button_wait
    sing_in_with_google_button_click                         if sing_in_with_google_button
    login_google_textfield_fill account[:login], delay: 3    if login_google_textfield_wait
    next_google_login_button_click                           if next_google_login_button_wait
    pass_google_textfield_fill account[:pass]                if pass_google_textfield_wait
    hardback delay: 3
    next_google_button_click                                 if next_google_button_wait
    name_dropbox_textfield_fill account[:name]               if name_dropbox_textfield_wait
    save_dropbox_button_click                                if save_dropbox_button_wait
  end
end
