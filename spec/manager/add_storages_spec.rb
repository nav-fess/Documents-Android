# frozen_string_literal: true

require 'spec_helper'

include AddStorage

add_data_storage = AuthDataTools.parse_json('StorageAddData.json')
timestamp = Time.now
add_data_storage.each do |portal_name, data_portals|
  data_portals['storage_data'].each do |data|
    describe 'Add Storage', storage: true do
      before(:all) do
        login = data_portals['account_data']['login']
        pass  = data_portals['account_data']['pass']
        Login.login_complete(portal_name, login, pass)
      end

      context "on  #{portal_name}:" do
        it 'tap on button connect third-party storage' do
          PlusFAB.open
          click_element = PlusFAB.connect
          expect(click_element).to be_truthy
        end

        it "#{data['name']}:" do
          portal = data['portal'] || ''
          login  = data['login']
          pass   = data['pass']

          case data['name']
          when 'google_drive' then GoogleDrive.create(login, pass)
          when 'drop_box'     then Dropbox.create(login, pass)
          when 'one_drive'    then OneDrive.create(login, pass)
          when 'yandex_disk'  then YandexDisk.create(login, pass)
          when 'box'          then Box.create(login, pass)
          when 'owncloud'     then OwnCloud.create(portal, login, pass)
          when 'nextcloud'    then NextCloud.create(portal, login, pass)
          when 'webdav'       then WebDAV.create(portal, login, pass)
          when 'sharepoint'   then Sharepoint.create(portal, login, pass)
          else puts 'Other storage'
          end

          hardback pause: 12
          element_exist = Login.find_accounts
          Helpers.screen folder: 'Add storage', screen_name: data['name'], pause: 4,
                         timestamp: timestamp
          expect(element_exist).to be_truthy
        end
      end
    end
  end
end
