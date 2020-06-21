# frozen_string_literal: true

# PageObject for NextCloud
class NextCloud < BasePageObject
  button 'item_nextcloud', xpath: "//android.view.ViewGroup[@index='7']"
  textfield 'url_nextcloud', id: 'storage_web_dav_url_edit'
  textfield 'login_nextcloud', id: 'storage_web_dav_login_edit'
  textfield 'pass_nextcloud', id: 'storage_web_dav_password_edit'
  textfield 'name_nextcloud', id: 'storage_web_dav_title_edit'
  button 'authorize_nextcloud', id: 'storage_web_dav_save_button'

  # frame Nextcloud
  button 'login_fmame_nc', xpath: "//android.widget.Button[@index='0']"
  textfield 'user_frame_nc', xpath: "//android.widget.EditText[@index='0']"
  textfield 'pass_frame_nc', xpath: "//android.widget.EditText[@text='Password']"
  button 'login_frame_next_nc', xpath: "//android.widget.Button[@index='0']"
  button 'access_frame_nc', xpath: "//android.widget.Button[@index='0']"

  def self.add_account(account)
    item_nextcloud_button_click                       if item_nextcloud_button_wait
    url_nextcloud_textfield_fill   account[:url]      if url_nextcloud_textfield_wait
    login_nextcloud_textfield_fill account[:login]    if login_nextcloud_textfield_wait
    pass_nextcloud_textfield_fill  account[:pass]     if pass_nextcloud_textfield_wait
    name_nextcloud_textfield_fill  account[:name]     if name_nextcloud_textfield_wait
    authorize_nextcloud_button_click                  if authorize_nextcloud_button_wait
  end
end
