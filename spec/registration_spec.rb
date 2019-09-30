require 'appium_lib'
require_relative '../spec/spec_helper.rb'
require_relative '../helpers/data_portals_helpers.rb'
include DataPotalHelpers

describe 'Registration in portal' do
  puts "Describe: #{metadata[:description]}"

  data_portals.each_key do |tl_domen|
  context 'User registration a portal' do |ms|
    puts "Context:  #{metadata[:description]}"

    it 'localization portal' do |it_info|
      sleep 2
      print "\n* #{it_info.description} =>  "
      locale = search_data_registration_portal(tl_domen,"locale" )
      language = search_data_registration_portal(tl_domen,"language" )
      caps['locale'] = locale
      caps['language'] = language
      restart
      (expect(caps['locale']).to eq(locale)) && (expect(caps['language']).to eq(language))
    end

    it 'click on skip button' do |it_info|
      sleep 2
      print "\n* #{it_info.description} =>  "
      click_on_element = find_element(id: "on_boarding_panel_skip_button").click
      expect(click_on_element).to be_truthy
    end

    it 'click on Clouds button' do |it_info|
      sleep 2
      print "\n* #{it_info.description} =>  "
      click_on_element = find_element(id: "menu_item_cloud").click
      expect(click_on_element).to be_truthy
    end

    it 'click on ONLYOFFICE button' do |it_info|
      sleep 2
      print "\n* #{it_info.description} =>  "
      click_on_element = find_element(id: "cloudsItemOnlyOffice").click
      expect(click_on_element).to be_truthy
    end

    it 'tap on the tab Create Portall' do |it_info|
      sleep 2
      print "\n* #{it_info.description} =>  "
      click_on_element = find_element(id:"login_enterprise_create_button").click
      expect(click_on_element).to be_truthy
     end

    it 'Input address portal' do |it_info|
      sleep 2
      print "\n* #{it_info.description} =>  "
      address = search_data_registration_portal(tl_domen,"portal")
      intput_text = find_element(id:"login_create_portal_address_edit").send_keys(address)
      expect(intput_text).to be_truthy
    end

    it 'Input email user`s' do |it_info|
      sleep 2
      print "\n* #{it_info.description} =>  "
      email_part =  search_data_registration_portal(tl_domen,"email" ) #.to_s.split( ".")
      intput_text = find_element(id:"login_create_portal_email_edit").send_keys(email_part)
      expect(intput_text).to be_truthy
    end

    it 'Input first name user`s' do |it_info|
      sleep 2
       print "\n* #{it_info.description} =>  "
       first_name =  search_data_registration_portal(tl_domen,"first_name" )
       intput_text =find_element(id:"login_create_portal_first_name_edit").send_keys(first_name)
       expect(intput_text).to be_truthy
     end

    it 'Input last name user`s' do |it_info|
      sleep 2
      print "\n* #{it_info.description} =>  "
      first_name =  search_data_registration_portal(tl_domen,"last_name" )
      intput_text =find_element(id:"login_create_portal_last_name_edit").send_keys(first_name)
      expect(intput_text).to be_truthy
    end

    it 'Tap on the button Next registration' do |it_info|
      sleep 2
      #@driver.hide_keyboard
      sleep 2
      print "\n* #{it_info.description} =>  "
      click_on_element = find_element(id:"login_signin_create_portal_button").click
      expect(click_on_element).to be_truthy
    end

    it 'Input password for registration' do |it_info|
      sleep 2
      print "\n* #{it_info.description} =>  "
      pass =  search_data_registration_portal(tl_domen,"p" )
      click_on_element = find_element(id:"login_signin_password_edit").send_keys(pass)
      expect(click_on_element).to be_truthy
    end

    it 'Repeat password for registration' do |it_info|
      sleep 2
      print "\n* #{it_info.description} =>  "
      pass =  search_data_registration_portal(tl_domen,"p" )
      click_on_element = find_element(id:"login_signin_repeat_edit").send_keys(pass)
      expect(click_on_element).to be_truthy
    end

    it 'Tap on the button Create' do |it_info|
      sleep 2
      print "\n* #{it_info.description} =>  "
      click_on_element = find_element(id:"login_signin_create_portal_button").click
      expect(click_on_element).to be_truthy
      sleep 5
    end

  end
  end
end
