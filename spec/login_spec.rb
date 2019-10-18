require 'appium_lib'
require_relative '../spec/spec_helper.rb'
require_relative '../helpers/helpers.rb'
include Helpers

login_data.each_key do |tl_domain|
  describe 'Portal login Without 2FA' do
    puts "Describe: #{metadata[:description]}"

    before(:all) do
      print "\n* Before: click on onlyoffice button =>  "
      capabilities_set('locale' => 'EN', 'language' => 'EN')
      click_id 'on_boarding_panel_skip_button'
      click_id 'menu_item_cloud'
      click_id 'cloudsItemOnlyOffice'
    end

    if %w[eu sg com info].include?(tl_domain)
      context "domain : #{tl_domain}" do
        puts "Context:  #{metadata[:description]}"

        it 'input portal name' do |it_info|
          print "\n* #{it_info.description} =>  "
          portal_name = login_data[tl_domain]['portal']
          input_text_id('login_enterprise_portal_edit', portal_name)
          click_on_logon_button = click_id'login_enterprise_next_button'
          expect(click_on_logon_button).to be_truthy
        end

        if login_data[tl_domain]['email'].eql?'google'
          it 'tap on google button' do |it_info|
            click_id 'login_social_google_button'
            click_xpath("*//android.widget.ListView[@index='3']/android.widget.LinearLayout[@index='0']")
            click_on_account = click_id 'accountContainer'
            expect(click_on_account).to be_truthy
          end
        elsif login_data[tl_domain]['email'].eql?'facebook'
        it 'tap on facebook button' do |it_info|
          fb_login = login_data[tl_domain]['fblogin']
          fbp = login_data[tl_domain]['fbp']
          click_id 'login_social_facebook_button'
          input_text_xpath("*//android.view.View[[@index='2']/android.widget.EditText[@index='0']", fb_login)
          input_text_xpath("*//android.view.View[[@index='2']/android.widget.EditText[@index='1']", fbp)
          click_xpath("*//android.widget.Button[@index='2']")
          click_on_account = click_id 'accountContainer'
          expect(click_on_account).to be_truthy
        end
        else
          it 'input data' do |it_info|
            print "\n* #{it_info.description} =>  "
            email = login_data[tl_domain]['email']
            pass =  login_data[tl_domain]['p']
            input_text_id('login_enterprise_portal_email_edit', email)
            input_text_id('login_enterprise_portal_password_edit', pass)
            click_id 'login_enterprise_signin_button'
            click_on_account = click_id 'accountContainer'
            expect(click_on_account).to be_truthy
          end
        end
      end

      next unless tl_domain.eql?'personal'

      context 'Personal:' do
        puts "Context:  #{metadata[:description]}"

        it 'click on personal tab' do |it_info|
          print "\n* #{it_info.description} =>  "
          click_on_tab = click_xpath("*//android.widget.TextView[@text='PERSONAL']")
          expect(click_on_tab).to be_truthy
        end

        it 'input data' do |it_info|
          print "\n* #{it_info.description} =>  "
          email = login_data[tl_domain]['email']
          pass =  login_data[tl_domain]['p']
          input_text_id('login_personal_portal_email_edit', email)
          input_text_id('login_personal_portal_password_edit', pass)
          click_id 'login_personal_signin_button'
          click_on_account = click_id 'accountContainer'
          expect(click_on_account).to be_truthy
        end
      end
    end
  end
end
