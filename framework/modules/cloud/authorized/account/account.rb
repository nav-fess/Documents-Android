# frozen_string_literal: true

# PageObject for CloudFileList
class Account < BasePageObject
  button 'context', id: 'accountItemContext'
  text 'account_name', id: 'accountItemName'
  text 'portal_name', id: 'accountItemPortal'
  text 'email', id: 'accountItemEmail'
  button 'add_account', id: 'fragment_accounts_add_account'
  button 'settings', id: 'settingsItem'
end
