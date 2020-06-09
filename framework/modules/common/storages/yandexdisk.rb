# frozen_string_literal: true

# PageObject for YandexDisk
class YandexDisk < BasePageObject
  button 'item_yandex_disk', xpath: "//android.view.ViewGroup[@index='3']"
  textfield 'login_yandex_disk', id: 'storage_web_dav_login_edit'
  textfield 'pass_yandex_disk', id: 'storage_web_dav_password_edit'
  textfield 'name_yandex_disk', id: 'storage_web_dav_title_edit'
  button 'connect_yandex_disk', id: 'storage_web_dav_save_button'

  def self.add_account(account)
    item_yandex_disk_button_click                         if item_yandex_disk_button_wait
    login_yandex_disk_textfield_fill  account[:login]     if login_yandex_disk_textfield_wait
    pass_yandex_disk_textfield_fill   account[:pass]      if pass_yandex_disk_textfield_wait
    name_yandex_disk_textfield_fill   account[:name]      if name_yandex_disk_textfield_wait
    connect_yandex_disk_button_click                      if connect_yandex_disk_button_wait
  end
end
