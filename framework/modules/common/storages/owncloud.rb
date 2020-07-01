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
    item_owncloud_button_click                        if item_owncloud_button_wait
    url_owncloud_textfield_fill   account[:url]       if url_owncloud_textfield_wait
    login_owncloud_textfield_fill account[:login]     if login_owncloud_textfield_wait
    pass_owncloud_textfield_fill  account[:pass]      if pass_owncloud_textfield_wait
    name_owncloud_textfield_fill  account[:name]      if name_owncloud_textfield_wait
    authorize_owncloud_button_click                   if authorize_owncloud_button_wait
  end

  def self.add_cloud(cloud)
    url_owncloud_textfield_fill   cloud[:name]
    login_owncloud_textfield_fill cloud[:login]
    pass_owncloud_textfield_fill  cloud[:pass]
    authorize_owncloud_button_click time: 10
  end

end
