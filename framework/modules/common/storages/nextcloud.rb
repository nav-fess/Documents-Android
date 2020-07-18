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
  textfield 'pass_frame_nc', xpath: "//android.widget.EditText[@index='0']"
  button 'login_frame_next_nc', xpath: "//android.widget.Button[@index='0']"
  button 'access_frame_nc', xpath: "//android.widget.Button[@index='0']"

  def self.add_storage(storage)
    item_nextcloud_button_click                     delay: 3, time: 2
    url_nextcloud_textfield_fill   storage[:url],   delay: 3, time: 2
    login_nextcloud_textfield_fill storage[:login], delay: 3, time: 2
    pass_nextcloud_textfield_fill  storage[:pass],  delay: 3, time: 2
    name_nextcloud_textfield_fill  storage[:name],  delay: 3, time: 2
    authorize_nextcloud_button_click                delay: 3, time: 2
  end

  def self.add_cloud(cloud)
    url_nextcloud_textfield_fill cloud[:name]
    authorize_nextcloud_button_click
    login_fmame_nc_button_click           time: 60
    user_frame_nc_textfields[0].send_keys cloud[:login]
    pass_frame_nc_textfields[1].send_keys cloud[:pass]
    login_frame_next_nc_button_click      time: 5
    access_frame_nc_button_click          delay: 30, time: 5
  end
end
