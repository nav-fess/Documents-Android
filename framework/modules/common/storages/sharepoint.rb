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
    item_sharepoint_button_click                               if item_sharepoint_button_wait
    url_sharepoint_textfield_fill    account[:url], delay: 2   if url_sharepoint_textfield_wait
    login_sharepoint_textfield_fill  account[:login]           if login_sharepoint_textfield_wait
    pass_sharepoint_textfield_fill   account[:pass]            if pass_sharepoint_textfield_wait
    name_sharepoint_textfield_fill   account[:name]            if name_sharepoint_textfield_wait
    authorize_sharepoint_button_click                          if authorize_sharepoint_button_wait
  end
end
