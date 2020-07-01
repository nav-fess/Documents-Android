# frozen_string_literal: true

# PageObject for CloudFileList
class Account < BasePageObject

  @@count_login = 0
  @@count_logout = 0
  @@cloud_type = %i[personal enterprise owncloud webdav] #nextcloud

  button 'context', id: 'accountItemContext'
  text 'account_name', id: 'accountItemName'
  text 'portal_name', id: 'accountItemPortal'
  text 'email', id: 'accountItemEmail'
  button 'add_account', id: 'fragment_accounts_add_account'
  button 'settings', id: 'settingsItem'
  button 'item_account', id: 'accountItemLayout'

  def self.add( clouds, type_cloud = @@cloud_type )
    type_cloud.each do |type|
      accounts = clouds[type]
      case type
      when :personal   then accounts.each  { |account| login_personal   account }
      when :enterprise then accounts.each  { |account| login_enterprise account }
      when :owncloud   then accounts.each  { |account| login_owncloud   account }
      when :nextcloud  then accounts.each  { |account| login_nextcloud  account }
      when :webdav     then accounts.each  { |account| login_webdav     account }
      end
    end
   hardback delay:5
  end

  def self.login_enterprise(account)
    CloudList.onlyoffice_button_click
    OnlyofficeEnterpriseLogin.perform account[:name], account[:login], account[:pass]
    back_clouds
  end

  def self.login_personal(account)
    CloudList.onlyoffice_button_click
    OnlyofficePersonalLogin.perform account[:login], account[:pass]
    back_clouds
  end

  def self.login_owncloud(account)
    CloudList.owncloud_button_click
    OwnCloud.add_cloud account
    back_clouds
  end

  def self.login_nextcloud(account)
    CloudList.nextcloud_button_click
    NextCloud.add_cloud account
    back_clouds
  end

  def self.login_webdav(account)
    CloudList.webdav_button_click
    WebDAV.add_cloud account
    back_clouds
  end

  def self.back_clouds
    @@count_login += 1
    BottomNavigationBar.profile_button_click
    add_account_button_click
  end

  def self.number_login
    @@count_login
  end

  def self.count_login_zero
    @@count_login = 0
  end

  def self.count_logout
    @@count_logout += 1
  end

  def self.number_logout
    @@count_logout
  end

  def self.count_logout_zero
    @@count_logout = 0
  end
end
