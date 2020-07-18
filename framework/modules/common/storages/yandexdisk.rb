# frozen_string_literal: true

# PageObject for YandexDisk
class YandexDisk < BasePageObject
  button 'item_yandex_disk', xpath: "//android.view.ViewGroup[@index='3']"
  textfield 'login_yandex_disk', id: 'storage_web_dav_login_edit'
  textfield 'pass_yandex_disk', id: 'storage_web_dav_password_edit'
  textfield 'name_yandex_disk', id: 'storage_web_dav_title_edit'
  button 'connect_yandex_disk', id: 'storage_web_dav_save_button'

  def self.add_storage(account)
    item_yandex_disk_button_click                      delay: 2, time: 2
    login_yandex_disk_textfield_fill  account[:login], delay: 2, time: 2
    pass_yandex_disk_textfield_fill   account[:pass],  delay: 2, time: 2
    name_yandex_disk_textfield_fill   account[:name],  delay: 2, time: 2
    connect_yandex_disk_button_click                   delay: 2, time: 2
  end
end
