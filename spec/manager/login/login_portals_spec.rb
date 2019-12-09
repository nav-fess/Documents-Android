# frozen_string_literal: true

require_relative '../../../spec/spec_helper.rb'
include AppiumExtension

login_data_portals.each do |type_login, data_portal|
  data_portal.each do |data|
    describe 'Portal login portals Without 2FA', login: 'portals' do
      before(:all) do
        Login.before_login
      end

      context "domain : #{type_login}" do
        it 'click on button portal' do
          click id: ID::CLOUDS_MENU_ITEM
        end

        it 'input portal name' do
          portal_name = data['portal']
          fill_form id: ID::ENTERPRISE_PORTAL, data: portal_name
          click_on_logon_button = click id: ID::ENTERPRISE_NEXT
          sleep 5
          expect(click_on_logon_button).to be_truthy
        end

        case type_login
        when 'enterprise'
          it 'input data portal' do
            email = data['login']
            pass = data['pass']
            fill_form id: ID::ENTERPRISE_EMAIL, data: email
            fill_form id: ID::ENTERPRISE_PASSWORD, data: pass
            click id: ID::ENTERPRISE_SIGN_IN
            element_exist = element id: ID::ACCOUNTS
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
