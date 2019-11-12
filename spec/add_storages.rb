# frozen_string_literal: true

require 'appium_lib'
require_relative '../spec/spec_helper.rb'
require_relative '../Framework/helpers/helpers.rb'
require_relative '../Framework/constants/id'
include Helpers

add_data_storage.each do |tl_domain, storages|
  describe 'Add Storage', storage: true do
    puts "Describe: #{metadata[:description]}"

    before(:all) do
      print "\n* Before: login on the #{tl_domain} =>  "
      Login.login_complete(tl_domain)
    end

    context "on  #{ tl_domain }:" do
    puts "Context:  #{metadata[:description]}"

    it 'tap on button connect third-party storage' do |it_info|
      print "\n* #{it_info.description} =>  "
      click_id 'app_floating_action_button'
      click_id 'list_explorer_action_storage'
    end

    storages.each do |storage, data_input|
      it "#{storage}:" do |it_info|
        print "\n* #{it_info.description} =>  "

        case  storage
        when 'google_drive'
          wait_true { texts[ConstIter::GOOGLE_STORAGE].click }
          wait_true { textfields[0].send_keys data_input['login'] }
          wait_true { buttons[2].click }
          wait_true { textfields[0].send_keys data_input['p'] }
          wait_true { buttons[1].click }
          sleep 4
          wait_true { buttons[3].click }
          click_id 'storage_connect_save'
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
