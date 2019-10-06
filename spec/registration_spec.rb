require 'appium_lib'
require_relative '../spec/spec_helper.rb'
require_relative '../helpers/helpers.rb'
include  Helpers

describe 'Registration in portal' do
  puts "Describe: #{metadata[:description]}"

  DataPortals.data_portals.each_key do |tl_domen|
    context 'User registration a portal'
    puts "Context:  #{metadata[:description]}"

    it 'localization portal' do |it_info|
      sleep 2
      print "\n* #{it_info.description} =>  "
      locale = DataPortals.search_data_registration_portal(tl_domen, 'locale')
      language = DataPortals
                 .search_data_registration_portal(tl_domen, 'language')
      caps['locale'] = locale
      caps['language'] = language
      restart
      (expect(caps['locale']).to eq(locale)) && 
        (expect(caps['language']).to eq(language))
    end

    it 'click on skip button' do |it_info|
      print "\n* #{it_info.description} =>  "
      click_on_element = DataPortals
                         .click_element_screen('id', 'on_boarding_panel_skip_button')
      expect(click_on_element).to be_truthy
    end

    it 'click on onlyoffice button' do |it_info|
      print "\n* #{it_info.description} =>  "
      click_on_menu = DataPortals.click_element_screen('id', 'menu_item_cloud')
      click_on_cloud = DataPortals
                       .click_element_screen('id', 'cloudsItemOnlyOffice')
      (expect(click_on_menu).to be_truthy) &&
        (expect(click_on_cloud).to be_truthy)
    end

    it 'tap on the tab Create Portall' do |it_info|
      print "\n* #{it_info.description} =>  "
      click_on_element = DataPortals
                         .click_element_screen('id', 'login_enterprise_create_button')
      expect(click_on_element).to be_truthy
    end

    it 'Input  account information' do |it_info|
      print "\n* #{it_info.description} =>  "
      address = DataPortals.search_data_registration_portal(tl_domen, 'portal')
      email = DataPortals.search_data_registration_portal(tl_domen, 'email')
      first_name = DataPortals
                   .search_data_registration_portal(tl_domen, 'first_name')
      last_name = DataPortals
                  .search_data_registration_portal(tl_domen, 'last_name')
      intput_address = DataPortals
                       .field_input_text('id', 'login_create_portal_address_edit', address)
      intput_email = DataPortals
                     .field_input_text('id', 'login_create_portal_email_edit', email)
      intput_first_name = DataPortals
                          .field_input_text('id', 'login_create_portal_first_name_edit', first_name)
      intput_last_name = DataPortals
                         .field_input_text('id', 'login_create_portal_last_name_edit', last_name)
      # @driver.hide_keyboard
      click_on_signin_button = DataPortals
                               .click_element_screen('id', 'login_signin_create_portal_button')
      (expect(intput_address).to be_truthy) && (expect(intput_email)
       .to be_truthy) && (expect(intput_first_name)
       .to be_truthy) && (expect(intput_last_name)
       .to be_truthy) && (expect(click_on_signin_button)
       .to be_truthy)
    end

    it 'Input password' do |it_info|
      print "\n* #{it_info.description} =>  "
      pass = DataPortals.search_data_registration_portal(tl_domen, 'p')
      pass_repeat = DataPortals.search_data_registration_portal(tl_domen, 'p')
      input_pass = DataPortals
                   .field_input_text('id', 'login_signin_password_edit', pass)
      input_pass_repeat = DataPortals
                          .field_input_text('id', 'login_signin_repeat_edit', pass_repeat)
      click_on_create_button = DataPortals
                               .click_element_screen('id', 'login_signin_create_portal_button')
      click_on_account = DataPortals
                         .click_element_screen('id', 'accountContainer')
      (expect(input_pass).to be_truthy) && (expect(input_pass_repeat)
       .to be_truthy) && (expect(click_on_create_button)
       .to be_truthy) && (expect(click_on_account).to be_truthy)
    end
  end
end
