# frozen_string_literal: true

# PageObject for Dropbox
class Dropbox < BasePageObject
  button 'item_dropbox', xpath: "//android.view.ViewGroup[@index='1']"
  button 'sing_in_with_google', xpath: "//android.widget.Button[@index='0']"
  button 'select_language', xpath: '//android.view.View'
  button 'english', xpath: '//android.view.View'
  button 'sign_in', xpath: '//android.view.ViewGroup[@index="0"]'
  textfield 'login_google', xpath: "//android.widget.EditText[@index='0']"
  button 'next_google_login', xpath: "//android.widget.Button[@text='Next']"
  textfield 'pass_google', xpath: "//android.widget.EditText[@index='0']"
  button 'next_google', xpath: "//android.widget.Button[@text='Next']"
  textfield 'name_dropbox', id: 'storage_connect_title_edit'
  button 'save_dropbox', id: 'storage_connect_save'

  def self.add_storage(account)
    item_dropbox_button_click        delay: 3, time: 2
    sing_in_with_google_button_click delay: 5, time: 2
    sign_in_button_click delay: 4
    select_language_buttons[19].click
    sleep 4
    english_buttons[32].click
    login_google_textfield_fill      account[:login], delay: 6
    next_google_login_button_click   delay: 3, time: 2
    pass_google_textfield_fill       account[:pass], delay: 3, time: 2
    hardback                         delay: 3
    next_google_button_click         delay: 3, time: 2
    name_dropbox_textfield_fill      account[:name], delay: 4, time: 2
    save_dropbox_button_click        delay: 5, time: 2
  end
end
