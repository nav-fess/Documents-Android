# frozen_string_literal: true

require 'appium_lib'
require_relative '../spec/spec_helper.rb'
require_relative '../helpers/helpers.rb'
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
      click_id 'app_floating_action_button'
      click_id 'list_explorer_action_storage'
    end

    storages.each do |storage, data_input|
      it "#{storage}:" do |it_info|
        pending
        print "\n* #{it_info.description} =>  "

        case  storage
        when 'google_drive'
          click_xpath "*//android.widget.TextView[@text='Google Drive']"
          textfields[0].send_keys data_input['login']
          buttons[2].click
          sleep 2
          textfields[0].send_keys  data_input['p']
          buttons[1].click
          buttons[3].click

          sleep 3
        when 'drop_box'
        when 'one_drive'
        when 'yandex_disk'
        when 'box'
        when 'owncloud'
        when 'nextcloud'
        when 'webdav'
         end
      end
    end
    end
  end
end
