# frozen_string_literal: true

# PageObject for OwnCloud
class OwnCloud < BasePageObject
  button 'item_owncloud', xpath: "//android.view.ViewGroup[@index='6']"
  textfield 'url_owncloud', id: 'storage_web_dav_url_edit'
  textfield 'login_owncloud', id: 'storage_web_dav_login_edit'
  textfield 'pass_owncloud', id: 'storage_web_dav_password_edit'
  textfield 'name_owncloud', id: 'storage_web_dav_title_edit'
  button 'authorize_owncloud', id: 'storage_web_dav_save_button'

  def self.add_storage(account)
    item_owncloud_button_click                     delay: 3, time: 2
    url_owncloud_textfield_fill   account[:url],   delay: 3, time: 2
    login_owncloud_textfield_fill account[:login], delay: 3, time: 2
    pass_owncloud_textfield_fill  account[:pass],  delay: 3, time: 2
    name_owncloud_textfield_fill  account[:name],  delay: 3, time: 2
    authorize_owncloud_button_click                delay: 3, time: 2
  end

  def self.add_cloud(cloud)
    url_owncloud_textfield_fill     cloud[:name]
    login_owncloud_textfield_fill   cloud[:login]
    pass_owncloud_textfield_fill    cloud[:pass]
    authorize_owncloud_button_click time: 10
  end
end
