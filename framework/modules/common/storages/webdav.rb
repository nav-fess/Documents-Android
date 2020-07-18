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
    item_webdav_button_click                       delay: 2, time: 2
    url_webdav_textfield_fill     storage[:url],   delay: 2, time: 2
    login_webdav_textfield_fill   storage[:login], delay: 2, time: 2
    pass_webdav_textfield_fill    storage[:pass],  delay: 2, time: 2
    name_webdav_textfield_fill    storage[:name],  delay: 2, time: 2
    authorize_webdav_button_click                  delay: 2, time: 2
  end

  def self.add_cloud(cloud)
    url_webdav_textfield_fill     cloud[:name],  delay: 2, time: 2
    login_webdav_textfield_fill   cloud[:login], delay: 2, time: 2
    pass_webdav_textfield_fill    cloud[:pass],  delay: 2, time: 2
    authorize_webdav_button_click
  end

  def self.login_after_logout(cloud)
    pass_webdav_textfield_fill cloud[:pass], delay: 2, time: 2
    authorize_webdav_button_click            delay: 2, time: 2
  end
end
