# frozen_string_literal: true

# PageObject for Cloud List
class CloudList < BasePageObject
  button 'get_started', id: 'startButton'
  button 'other_storage', id: 'otherStorageButton'

  button 'onlyoffice', id: 'cloudsItemOnlyOffice'
  button 'nextcloud', id: 'cloudsItemNextCloud'
  button 'owncloud', id: 'cloudsItemOwnCloud'
  button 'webdav', id: 'cloudsItemWebDav'
end
