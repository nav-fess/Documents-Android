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

  def self.add_storage(storage)
    item_nextcloud_button_click                       if item_nextcloud_button_wait
    url_nextcloud_textfield_fill   storage[:url]      if url_nextcloud_textfield_wait
    login_nextcloud_textfield_fill storage[:login]    if login_nextcloud_textfield_wait
    pass_nextcloud_textfield_fill  storage[:pass]     if pass_nextcloud_textfield_wait
    name_nextcloud_textfield_fill  storage[:name]     if name_nextcloud_textfield_wait
    authorize_nextcloud_button_click                  if authorize_nextcloud_button_wait
  end

  def self.add_cloud(cloud)
    url_nextcloud_textfield_fill cloud[:name]
    authorize_nextcloud_button_click
    login_fmame_nc_button_click time: 60
    user_frame_nc_textfield_fill cloud[:login]
    pass_frame_nc_textfield_fill cloud[:pass]
    login_frame_next_nc_button_click time: 5
    access_frame_nc_button_click delay: 30, time: 5
  end
end
