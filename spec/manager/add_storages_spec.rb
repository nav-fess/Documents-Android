# frozen_string_literal: true

require 'appium_lib'
require_relative '../../spec/spec_helper.rb'
require_relative '../../framework/helpers/helpers.rb'
require_relative '../../framework/helpers/add_storage_helper.rb'
require_relative '../../framework/constants/id.rb'
require_relative '../../framework/constants/const_index.rb'
require_relative '../../framework/tools/appium_extension.rb'
include Helpers

add_data_storage.each do |tl_domain, storages|
  storages.each do |storage, data_input|
    describe 'Add Storage', storage: true do
      puts "Describe: #{metadata[:description]}"

      before(:all) do
        print "\n* Before: login on the #{tl_domain} =>  "
        Login.login_complete(tl_domain)
      end

      context "on  #{tl_domain}:" do
        puts "Context:  #{metadata[:description]}"

        it 'tap on button connect third-party storage' do |it_info|
          print "\n* #{it_info.description} =>  "
          click id: ID::PLUS_FAB
          click_element = click id: ID::CONNECT_STORAGE
          expect(click_element).to be_truthy
        end

        it "#{storage}:" do |it_info|
          print "\n* #{it_info.description} =>  "

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
