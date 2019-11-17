# frozen_string_literal: true

require 'appium_lib'
require_relative '../spec/spec_helper.rb'
require_relative '../Framework/helpers/helpers.rb'
require_relative '../Framework/helpers/add_storage_helper.rb'
require_relative '../Framework/constants/id.rb'
require_relative '../Framework/constants/const_index.rb'
require_relative '../Framework/Tools/appium_extension.rb'
include Helpers

add_data_storage.each do |tl_domain, storages|
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
        click id: ID::CONNECT_STORAGE
      end

      storages.each do |storage, data_input|
        it "#{storage}:" do |it_info|
          print "\n* #{it_info.description} =>  "
          element_exist = ''

          case storage
          when 'google_drive'
            element_exist = AddStorage.google_drive(data_input['login'], data_input['p'])
          when 'drop_box'
            element_exist = AddStorage.dropbox(data_input['login'], data_input['p'])
          when 'one_drive'
            element_exist = AddStorage.one_drive(data_input['login'], data_input['p'])
          when 'yandex_disk'
            puts 'pending'
          when 'box'
            puts 'pending'
          when 'owncloud'
            puts 'pending'
          when 'nextcloud'
            puts 'pending'
          when 'webdav'
            puts 'pending'
          else
            puts "not storage"
          end
          expect(element_exist).to be_truthy
        end
      end
    end
  end
end
