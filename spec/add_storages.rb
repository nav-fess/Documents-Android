# frozen_string_literal: true

require 'appium_lib'
require_relative '../spec/spec_helper.rb'
require_relative '../Framework/helpers/helpers.rb'
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

          case  storage
          when 'google_drive'
            click text: ConstIndex::GOOGLE_STORAGE, pause: 3
            fill_form textfield: ConstIndex::GOOGLE_EMAIL,
                      data: data_input['login']

            click button: ConstIndex::GOOGLE_NEXT_ONE
            fill_form textfield: ConstIndex::GOOGLE_PASS_STORAGE,
                      data: data_input['p'], pause: 3

            click button: ConstIndex::GOOGLE_NEXT_TWO
            click button: ConstIndex::GOOGLE_NEXT_THREE, pause: 4
            click id: ID::CONNECT_SAVE
            sleep 3
          when 'drop_box'
            puts 'pending'
          when 'one_drive'
            puts 'pending'
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
          end
        end
      end
    end
  end
end
