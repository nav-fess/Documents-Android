# frozen_string_literal: true

require_relative '../../spec/spec_helper.rb'
include AppiumExtension

add_data_storage.each do |tl_domain, storages|
  storages.each do |storage, data_input|
    describe 'Add Storage', storage: true do
      before(:all) do
        Login.login_complete(tl_domain)
      end

      context "on  #{tl_domain}:" do
        it 'tap on button connect third-party storage' do
          click id: ID::PLUS_FAB
          click_element = click id: ID::CONNECT_STORAGE
          expect(click_element).to be_truthy
        end

        it "#{storage}:" do
          login  = data_input['login']
          pass   = data_input['p']
          portal = data_input['portal'] || ''

          case storage
          when 'google_drive' then AddStorage.google_drive(login, pass)
          when 'drop_box' then AddStorage.dropbox(login, pass)
          when 'one_drive' then AddStorage.one_drive(login, pass)
          when 'yandex_disk' then AddStorage.yandex_disk(login, pass)
          when 'box' then AddStorage.box(login, pass)
          when 'owncloud' then AddStorage.owncloud(portal, login, pass)
          when 'nextcloud' then AddStorage.nextcloud(portal, login, pass)
          when 'webdav' then AddStorage.webdav(portal, login, pass)
          when 'sharepoint' then AddStorage.sharepoint(portal, login, pass)
          else puts 'Other storage'
          end

          click button: ConstIndex::BACK, pause: 12
          element_exist = element id: ID::ACCOUNTS, pause: 5
          expect(element_exist).to be_truthy
        end
      end
    end
  end
end
