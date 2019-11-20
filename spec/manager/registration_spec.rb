# frozen_string_literal: true

require 'appium_lib'
require_relative '../spec/helper.rb'
require_relative '../framework/helpers/registration_helper.rb'
require_relative '../framework/helpers/helpers.rb'
require_relative '../framework/tools/appium_extension.rb'
require_relative '../framework/constants/id.rb'
include Helpers
include AppiumExtension

describe 'Registration in portal', registration: true do
  puts "Describe: #{metadata[:description]}"
  registration_data.each_key do |tl_domain|
    context 'Without 2FA' do
      puts "Context:  #{metadata[:description]}"
      it 'localization portal' do |it_info|
        print "\n\n #{it_info.description} =>  "
        sleep 2
        locale = DataPortals.locale_language(tl_domain)['locale']
        language = DataPortals.locale_language(tl_domain)['language']
        capabilities_set('locale' => locale, 'language' => language)
        expect(caps['locale']).to eq(locale)
        expect(caps['language']).to eq(language)
      end

      it 'click on skip button' do |it_info|
        print "\n* #{it_info.description} =>  "
        click_on_element = click id: ID::SKIP_ONBOARDING
        expect(click_on_element).to be_truthy
      end

      it 'click on onlyoffice button' do |it_info|
        print "\n* #{it_info.description} =>  "
        click id: ID::CLOUDS
        click_on_cloud = click id: ID::CLOUDS_MENU_ITEM
        expect(click_on_cloud).to be_truthy
      end

      it 'tap on the tab Create Portall' do |it_info|
        print "\n* #{it_info.description} =>  "
        click_on_element = click id: ID::REGISTRATION_CREATE
        expect(click_on_element).to be_truthy
      end

      it 'Input account information' do |it_info|
        print "\n* #{it_info.description} =>  "
        portal_name = registration_data[tl_domain]['portal']
        email       = registration_data[tl_domain]['email']
        first_name  = registration_data[tl_domain]['first_name']
        last_name   = registration_data[tl_domain]['last_name']
        DataPortals.change_domain_to_info if tl_domain.eql? 'info'
        fill_form id: ID::REGISTRATION_NAME, data: portal_name
        domain_field = element(id: ID::REGISTRATION_DOMAIN).text.split('.').last
        fill_form id: ID::REGISTRATION_EMAIL, data: email
        fill_form id: ID::REGISTRATION_FN, data: first_name
        fill_form id: ID::REGISTRATION_LN, data: last_name
        click_on_sign_in_button = click id: ID::REGISTRATION_SIGN
        expect(click_on_sign_in_button).to be_truthy
        expect(domain_field).to eq(tl_domain)
      end

      it 'Input password' do |it_info|
        print "\n* #{it_info.description} =>  "
        pass = registration_data[tl_domain]['p']
        fill_form id: ID::REGISTRATION_PASS, data: pass
        fill_form id: ID::REGISTRATION_R_PASS, data: pass
        click id: ID::REGISTRATION_SIGN
        sleep 5
        click_on_account = click id: ID::ACCOUNTS
        expect(click_on_account).to be_truthy
      end
    end
  end
end
