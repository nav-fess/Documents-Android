# frozen_string_literal: true

# ContextAccount for CloudFileList
class ContextAccount < BasePageObject
  text 'account_name', id: 'accountItemName'
  text 'portal_name', id: 'accountItemPortal'
  text 'email', id: 'accountItemEmail'
  button 'profile', id: 'profileItem'
  button 'logout', id: 'logoutItem'
  button 'remove', id: 'removeItem'
end
