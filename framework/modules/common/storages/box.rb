# frozen_string_literal: true

# PageObject for Box
class Box < BasePageObject
  button 'item_box', xpath: "//android.view.ViewGroup[@index='4']"
  textfield 'login_box', xpath: "//android.widget.EditText[@index='0']"
  textfield 'pass_box', xpath: "//android.widget.EditText[@index='0']"
  button 'authorize_box', xpath: "//android.widget.Button[@text='Authorize']"
  button 'allow_access_box',
         xpath: "//android.widget.Button[@text='Разрешить доступ к Box']"
  textfield 'name_box', id: 'storage_connect_title_edit'
  button 'save_box', id: 'storage_connect_save'

  def self.add_account(account)
    item_box_button_click                                if item_box_button_wait
    login_box_textfields[0].send_keys account[:login]    if login_box_textfield_wait
    pass_box_textfields[1].send_keys account[:pass]      if pass_box_textfield_wait
    authorize_box_button_click                           if authorize_box_button_wait
    allow_access_box_button_click delay: 4               if allow_access_box_button_wait
    name_box_textfield_fill account[:name]               if name_box_textfield_wait
    save_box_button_click                                if save_box_button_wait
  end
end
