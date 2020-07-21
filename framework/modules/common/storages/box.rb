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

  def self.add_storage(account)
    item_box_button_click             delay: 3, time: 2
    login_box_textfields[0].send_keys account[:login]
    pass_box_textfields[1].send_keys  account[:pass]
    authorize_box_button_click        delay: 3, time: 2
    allow_access_box_button_click     delay: 4, time: 2
    name_box_textfield_fill           account[:name], delay: 3, time: 2
    save_box_button_click             delay: 3, time: 2
  end
end
