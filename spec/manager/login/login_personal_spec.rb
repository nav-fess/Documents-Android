# frozen_string_literal: true

require 'spec_helper'

login_data_personal = AuthDataTools.parse_json('PersonalLoginData.json')
time = Time.now
login_data_personal.each do |domain, data_login|
  data_login.each do |data|
    describe 'Portal login Personal Without 2FA', login: 'personal' do
      before(:all) do
        Login.before_login
        Login.open_onlyoffice_connect
      end

      context 'Personal:' do
        it 'click on personal tab' do
          click_on_tab = Login.tap_personal_tab
          expect(click_on_tab).to be_truthy
        end

        case domain
        when 'personal'
          it 'input data' do
            email = data['login']
            pass =  data['pass']
            Login.fill_personal_email email
            Login.fill_personal_password pass
            Login.tap_personal_sign_in
            Helpers.screen('Login Personal', domain, {pause: 4, time:time})
            element_exist = Login.find_accounts
            expect(element_exist).to be_truthy
          end
        when 'google'
          it 'tap on google button' do
            element_exist = Login.login_google
            Helpers.screen('Login Personal', domain, {pause: 4, time:time})
            expect(element_exist).to be_truthy
          end
        when 'facebook'
          it 'tap on facebook button' do
            fb_login = data['login']
            fbp = data['pass']
            element_exist = Login.login_facebook(fb_login, fbp)
            Helpers.screen('Login Personal', domain, {pause: 4, time:time})
            expect(element_exist).to be_truthy
          end
        end
      end
    end
  end
end
