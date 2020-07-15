# frozen_string_literal: true

# PageObject for Google
class Google < BasePageObject
  view 'item_google', id: 'storage_item_layout'
  textfield 'login_google', xpath: "//android.widget.EditText[@index='0']"
  button 'next_google_login', xpath: "//android.widget.Button[@text='Next']"
  textfield 'pass_google', xpath: "//android.widget.EditText[@index='0']"
  button 'next_google_pass', xpath: "//android.widget.Button[@text='Next']"
  button 'label', xpath: "//android.view.View[@text='nct.devices@gmail.com']"
  button 'allow_google', xpath: "//android.widget.Button[@text='Разрешить']"
  textfield 'name_google', id: 'storage_connect_title_edit'
  button 'save_google', id: 'storage_connect_save'

  def self.add_storage(account)
    item_google_views[0].click                      if item_google_view_wait
    login_google_textfield_fill account[:login]     if login_google_textfield_wait
    next_google_login_button_click                  if next_google_login_button_wait
    pass_google_textfield_fill account[:pass]       if pass_google_textfield_wait
    back
    next_google_pass_button_click                   if next_google_pass_button_wait
    sleep 5
    swipe_down(label_button, 3, 1, 300) if label_button_wait
    allow_google_button_click                       if allow_google_button_wait
    name_google_textfield_fill account[:name]       if name_google_textfield_wait
    save_google_button_click                        if save_google_button_wait
  end
end
