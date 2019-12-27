# frozen_string_literal: true

require 'spec_helper'

registration_data = AuthDataTools.parse_json('PortalRegistrationData.json')
timestamp = Time.now
describe 'Registration in portal', registration: true do
  registration_data.each do |domain, data_portal|
    data_portal.each do |data|
      context 'Without 2FA' do
        it 'localization portal' do
          sleep 2
          locale = Registration.locale_language(domain)['locale']
          language = Registration.locale_language(domain)['language']
          Helpers.capabilities_set('locale' => locale, 'language' => language)
          expect(caps['locale']).to eq(locale)
          expect(caps['language']).to eq(language)
        end

        it 'click on skip button' do
          click_on_element = Registration.tap_on_skip
          expect(click_on_element).to be_truthy
        end

        it 'click on onlyoffice button' do
          Registration.tap_on_clouds
          click_on_cloud = Registration.tap_on_onlyoffice
          expect(click_on_cloud).to be_truthy
        end

        it 'tap on the tab Create Portall' do
          click_on_element = Registration.tap_on_registration_button
          expect(click_on_element).to be_truthy
        end

        it 'Input account information' do
          portal_name = data['portal']
          email       = data['email']
          first_name  = data['first_name']
          last_name   = data['last_name']

          Registration.change_domain_to_info if domain.eql? 'info'

          Registration.fill_portal_name portal_name
          domain_field = Registration.top_level_domain
          Registration.fill_email email
          Registration.fill_first_name first_name
          Registration.fill_last_name last_name
          click_on_sign_in_button = Registration.sign_in
          expect(click_on_sign_in_button).to be_truthy
          expect(domain_field).to eq(domain)
        end

        it 'Input password' do
          pass = data['pass']
          Registration.fill_pass pass
          Registration.re_fill_pass pass
          Registration.sign_in
          sleep 5
          click_on_account = Login.find_accounts
          Helpers.screen folder: 'Registration', screen_name: data['portal'], pause: 4,
                         timestamp: timestamp
          expect(click_on_account).to be_truthy
        end
      end
    end
  end
end
