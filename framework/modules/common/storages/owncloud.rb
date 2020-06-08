# frozen_string_literal: true

# PageObject for OwnCloud
class OwnCloud < BasePageObject
  button 'item_owncloud', xpath: "//android.view.ViewGroup[@index='6']"
  textfield 'url_owncloud', id: 'storage_web_dav_url_edit'
  textfield 'login_owncloud', id: 'storage_web_dav_login_edit'
  textfield 'pass_owncloud', id: 'storage_web_dav_password_edit'
  textfield 'name_owncloud', id: 'storage_web_dav_title_edit'
  button 'authorize_owncloud', id: 'storage_web_dav_save_button'

  def self.add_account(account)
    item_owncloud_button_click                        if item_owncloud_button_wait
    url_owncloud_textfield_fill account[:portal_st]   if url_owncloud_textfield_wait
    login_owncloud_textfield_fill account[:login_st]  if login_owncloud_textfield_wait
    pass_owncloud_textfield_fill account[:pass_st]    if pass_owncloud_textfield_wait
    name_owncloud_textfield_fill account[:storage]    if name_owncloud_textfield_wait
    authorize_owncloud_button_click                   if authorize_owncloud_button_wait
  end
end
