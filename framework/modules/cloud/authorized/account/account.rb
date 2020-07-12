# frozen_string_literal: true

# PageObject for Account
class Account < BasePageObject
  CLOUD_TYPE = %i[personal enterprise nextcloud owncloud webdav].freeze

  button 'context', id: 'accountItemContext'
  text 'account_name', id: 'accountItemName'
  text 'portal_name', id: 'accountItemPortal'
  text 'email', id: 'accountItemEmail'
  button 'add_account', id: 'fragment_accounts_add_account'
  button 'settings', id: 'settingsItem'
  button 'item_account', id: 'accountItemLayout'

  def self.login_again(type_cloud, account)
    case type_cloud
    when :personal   then OnlyofficeEnterpriseLogin.login_after_logout account
    when :enterprise then OnlyofficeEnterpriseLogin.login_after_logout account
    when :owncloud   then OwnCloud.add_cloud                           account
    when :nextcloud  then NextCloud.add_cloud                          account
    when :webdav     then WebDAV.login_after_logout                    account
    end
  end

  def self.add(clouds, type_cloud = CLOUD_TYPE)
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
    hardback delay: 5
  end

  def self.login_enterprise(account)
    CloudList.onlyoffice_button_click
    OnlyofficeEnterpriseLogin.add_cloud account
    back_clouds
  end

  def self.login_personal(account)
    CloudList.onlyoffice_button_click
    OnlyofficePersonalLogin.add_cloud account
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
    BottomNavigationBar.profile_button_click
    add_account_button_click
  end
end
