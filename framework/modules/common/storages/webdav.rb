# frozen_string_literal: true

# PageObject for WebDAV
class WebDAV < BasePageObject
  button 'item_webdav', xpath: "//android.view.ViewGroup[@index='8']"
  textfield 'url_webdav', id: 'storage_web_dav_url_edit'
  textfield 'login_webdav', id: 'storage_web_dav_login_edit'
  textfield 'pass_webdav', id: 'storage_web_dav_password_edit'
  textfield 'name_webdav', id: 'storage_web_dav_title_edit'
  button 'authorize_webdav', id: 'storage_web_dav_save_button'

  def self.add_account(account)
    item_webdav_button_click                       if item_webdav_button_wait
    url_webdav_textfield_fill     account[:url]    if url_webdav_textfield_wait
    login_webdav_textfield_fill   account[:login]  if login_webdav_textfield_wait
    pass_webdav_textfield_fill    account[:pass]   if pass_webdav_textfield_wait
    name_webdav_textfield_fill    account[:name]   if name_webdav_textfield_wait
    authorize_webdav_button_click                  if authorize_webdav_button_wait
  end
end