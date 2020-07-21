# frozen_string_literal: true

# PageObject for SharePoint
class SharePoint < BasePageObject
  button 'item_sharepoint', xpath: "//android.view.ViewGroup[@index='5']"
  textfield 'url_sharepoint', id: 'storage_web_dav_url_edit'
  textfield 'login_sharepoint', id: 'storage_web_dav_login_edit'
  textfield 'pass_sharepoint', id: 'storage_web_dav_password_edit'
  textfield 'name_sharepoint', id: 'storage_web_dav_title_edit'
  button 'authorize_sharepoint', id: 'storage_web_dav_save_button'

  def self.add_account(account)
    item_sharepoint_button_click                      delay: 3, time: 2
    url_sharepoint_textfield_fill    account[:url],   delay: 2, time: 2
    login_sharepoint_textfield_fill  account[:login], delay: 2, time: 2
    pass_sharepoint_textfield_fill   account[:pass],  delay: 2, time: 2
    name_sharepoint_textfield_fill   account[:name],  delay: 2, time: 2
    authorize_sharepoint_button_click                 delay: 2, time: 2
  end
end
