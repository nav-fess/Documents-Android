# frozen_string_literal: true

require 'spec_helper'

login_data_portals = AuthDataTools.parse_json('PortalLoginData.json')

login_data_portals.each do |type_login, data_portal|
  data_portal.each do |data|
    describe 'Portal login portals Without 2FA', login: 'portals' do
      before(:all) do
        Login.before_login
      end

      context "domain : #{data['portal']}" do
        it 'click on button portal' do
          Login.open_onlyoffice_connect
        end

        it 'input portal name' do
          portal_name = data['portal']
          Login.fill_enterprise_portal_address portal_name
          click_on_login_button = Login.open_enterprise_account_form
          sleep 5
          expect(click_on_login_button).to be_truthy
        end

        case type_login
        when 'enterprise'
          it 'input data portal' do
            email = data['login']
            password = data['pass']
            Login.fill_enterprise_email email
            Login.fill_enterprise_password password
            Login.click_enterprise_sign_in
            element_exist = Login.find_accounts
            expect(element_exist).to be_truthy
          end
        when 'google'
          it 'tap on google button' do
            element_exist = Login.login_google
            expect(element_exist).to be_truthy
          end
        when 'facebook'
          it 'tap on facebook button' do
            fb_login = data['login']
            fbp = data['pass']
            element_exist = Login.login_facebook(fb_login, fbp)
            expect(element_exist).to be_truthy
          end
        end
      end
    end
  end
end
