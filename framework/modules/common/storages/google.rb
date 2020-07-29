# frozen_string_literal: true

# PageObject for Google
class Google < BasePageObject
  view 'item_google', id: 'storage_item_layout'
  textfield 'login_google', xpath: '//android.widget.EditText[@index="0"]'
  button 'next_google_login', xpath: "//android.widget.Button[@text='Next']"
  button 'select_language', xpath: '//android.view.View'
  button 'english', xpath: '//android.view.View'
  textfield 'pass_google', xpath: "//android.widget.EditText[@index='0']"
  button 'next_google_pass', xpath: "//android.widget.Button[@text='Next']"
  button 'label', xpath: "//android.view.View[@text='nct.devices@gmail.com']"
  button 'allow_google', xpath: "//android.widget.Button[@text='Allow']"
  textfield 'name_google', id: 'storage_connect_title_edit'
  button 'save_google', id: 'storage_connect_save'

  def self.add_storage(account)
    item_google_views[0].click
    select_language_buttons[19].click
    sleep 3
    english_buttons[31].click
    login_google_textfield_fill    account[:login], delay: 3, time: 2
    next_google_login_button_click delay: 3, time: 2
    pass_google_textfield_fill     account[:pass], delay: 4
    back
    next_google_pass_button_click delay: 3, time: 2
    sleep 5
    swipe_down(label_button, 3, 1, 300)
    allow_google_button_click     delay: 3, time: 2
    name_google_textfield_fill    account[:name], delay: 3, time: 2
    save_google_button_click      delay: 3, time: 2
  end
end
