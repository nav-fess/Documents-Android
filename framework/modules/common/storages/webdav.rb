# frozen_string_literal: true

# PageObject for WebDAV
class WebDAV < BasePageObject
  button 'item_webdav', xpath: "//android.view.ViewGroup[@index='8']"
  textfield 'url_webdav', id: 'storage_web_dav_url_edit'
  textfield 'login_webdav', id: 'storage_web_dav_login_edit'
  textfield 'pass_webdav', id: 'storage_web_dav_password_edit'
  textfield 'name_webdav', id: 'storage_web_dav_title_edit'
  button 'authorize_webdav', id: 'storage_web_dav_save_button'

  def self.add_storage(storage)
    item_webdav_button_click                       if item_webdav_button_wait
    url_webdav_textfield_fill     storage[:url]    if url_webdav_textfield_wait
    login_webdav_textfield_fill   storage[:login]  if login_webdav_textfield_wait
    pass_webdav_textfield_fill    storage[:pass]   if pass_webdav_textfield_wait
    name_webdav_textfield_fill    storage[:name]   if name_webdav_textfield_wait
    authorize_webdav_button_click                  if authorize_webdav_button_wait
  end

  def self.add_cloud(cloud)
    url_webdav_textfield_fill     cloud[:name]
    login_webdav_textfield_fill   cloud[:login]
    pass_webdav_textfield_fill    cloud[:pass]
    authorize_webdav_button_click
  end

  def self.login_after_logout(cloud)
    pass_webdav_textfield_fill cloud[:pass]
    authorize_webdav_button_click
  end
end
