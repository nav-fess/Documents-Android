require 'appium_lib'
require_relative '../spec/spec_helper.rb'
require_relative '../helpers/helpers.rb'
include  Helpers

describe 'Registration in portal' do
  puts "Describe: #{metadata[:description]}"

   $data_portals.each_key do |tl_domen|
   # context 'Wihout 2FA'
   # puts "Context:  #{metadata[:description]}"

    it 'localization portal' do |it_info|
      sleep 2
      print "\n* #{it_info.description} =>  "
      locale = DataPortals.locale_language(tl_domen)[:locale]
      language = DataPortals.locale_language(tl_domen)[:language]
      caps['locale'] = locale
      caps['language'] = language
      restart
      restart
      expect(caps['locale']).to eq(locale)
      expect(caps['language']).to eq(language)
    end

    it 'click on skip button' do |it_info|
      print "\n* #{it_info.description} =>  "
      click_on_element = click_id 'on_boarding_panel_skip_button'
      expect(click_on_element).to be_truthy
    end

    it 'click on onlyoffice button' do |it_info|
      print "\n* #{it_info.description} =>  "
      click_id 'menu_item_cloud'
      click_on_cloud = click_id'cloudsItemOnlyOffice'
      expect(click_on_cloud).to be_truthy
    end

    it 'tap on the tab Create Portall' do |it_info|
      print "\n* #{it_info.description} =>  "
      click_on_element = click_id 'login_enterprise_create_button'
      expect(click_on_element).to be_truthy
    end

    it 'Input account information' do |it_info|
      print "\n* #{it_info.description} =>  "
      portal_name = $data_portals[tl_domen]["portal"]
      email       = $data_portals[tl_domen]["email"]
      first_name  = $data_portals[tl_domen]["first_name"]
      last_name   = $data_portals[tl_domen]["last_name"]
      input_text_id( 'login_create_portal_address_edit', portal_name)
      domain_field = get_text_id('login_create_portal_address_hint_end').split('.').last
      input_text_id( 'login_create_portal_email_edit', email)
      input_text_id( 'login_create_portal_first_name_edit', first_name)
      input_text_id( 'login_create_portal_last_name_edit', last_name)
      click_on_signin_button = click_id('login_signin_create_portal_button')
      expect(click_on_signin_button ).to be_truthy
      expect(domain_field).to eq(tl_domen)
    end

    it 'Input password' do |it_info|
      print "\n* #{it_info.description} =>  "
      pass = $data_portals[tl_domen]["p"]
      input_text_id('login_signin_password_edit', pass)
      input_text_id( 'login_signin_repeat_edit', pass)
      click_id 'login_signin_create_portal_button'
      click_on_account = click_id 'accountContainer'
      expect(click_on_account).to be_truthy
    end
   end
end