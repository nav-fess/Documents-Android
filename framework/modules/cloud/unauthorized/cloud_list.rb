# frozen_string_literal: true

# PageObject for Cloud List
class CloudList < BasePageObject
  button 'onlyoffice', id: 'cloudsItemOnlyOffice'
  button 'nextcloud', id: 'cloudsItemNextCloud'
  button 'owncloud', id: 'cloudsItemOwnCloud'
  button 'webdav', id: 'cloudsItemWebDav'
end
