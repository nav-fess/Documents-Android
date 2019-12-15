# frozen_string_literal: true

require_relative '../../../spec/spec_helper.rb'

login_data_personal.each do |domain, data_login|
  data_login.each do |data|
    describe 'Portal login Personal Without 2FA', login: 'personal' do
      before(:all) do
        Login.before_login
        click id: ID::CLOUDS_MENU_ITEM
      end

      context 'Personal:' do
        it 'click on personal tab' do
          click_on_tab = click text: ConstIndex::PERSONAL_TAB, pause: 2
          expect(click_on_tab).to be_truthy
        end

        case domain
        when 'personal'
          it 'input data' do
            login = data['login']
            pass =  data['pass']
            fill_form id: ID::PERSONAL_EMAIL, data: login
            fill_form id: ID::PERSONAL_PASSWORD, data: pass
            click id: ID::PERSONAL_SIGN_IN
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
