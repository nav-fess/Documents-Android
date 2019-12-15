# frozen_string_literal: true

require_relative '../spec_helper.rb'
require_relative '../../framework/helpers/helpers.rb'

describe 'Registration in portal', registration: true do
  registration_data.each do |domain, data_portal|
    data_portal.each do |data|
      context 'Without 2FA' do
        it 'localization portal' do
          sleep 2
          locale = DataPortals.locale_language(domain)['locale']
          language = DataPortals.locale_language(domain)['language']
          capabilities_set('locale' => locale, 'language' => language)
          expect(caps['locale']).to eq(locale)
          expect(caps['language']).to eq(language)
        end

        it 'click on skip button' do
          click_on_element = click id: ID::SKIP_ONBOARDING
          expect(click_on_element).to be_truthy
        end

        it 'click on onlyoffice button' do
          click id: ID::CLOUDS
          click_on_cloud = click id: ID::CLOUDS_MENU_ITEM
          expect(click_on_cloud).to be_truthy
        end

        it 'tap on the tab Create Portall' do
          click_on_element = click id: ID::REGISTRATION_CREATE
          expect(click_on_element).to be_truthy
        end

        it 'Input account information' do
          portal_name = data['portal']
          email       = data['email']
          first_name  = data['first_name']
          last_name   = data['last_name']
          DataPortals.change_domain_to_info if domain.eql? 'info'

          fill_form id: ID::REGISTRATION_NAME, data: portal_name
          domain_field = element(id: ID::REGISTRATION_DOMAIN).text.split('.').last
          fill_form id: ID::REGISTRATION_EMAIL, data: email
          fill_form id: ID::REGISTRATION_FN, data: first_name
          fill_form id: ID::REGISTRATION_LN, data: last_name
          click_on_sign_in_button = click id: ID::REGISTRATION_SIGN

          expect(click_on_sign_in_button).to be_truthy
          expect(domain_field).to eq(domain)
        end

        it 'Input password' do
          pass = data['pass']
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
end
