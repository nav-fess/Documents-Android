# frozen_string_literal: true

require 'appium_lib'
require_relative '../spec/spec_helper.rb'
require_relative '../helpers/helpers.rb'
include Helpers

=begin
example PortalLoginDaga.json:

{
  "domen": { "portal":"portal_name","email":"email_name","p":"pass"},
  "domen": { "portal":"portal_name","email":"facebook","fblogin":"email_for_facebook" ,"fbp":"pass_facebook"},
  "domen": { "portal":"portal_name","email":"google"},
}

domen = Personal|Personal2|...|Personaln
=end


login_data_portals.each_key do |tl_domain|
  describe 'Portal login portals Without 2FA', login: 'portals' do
    puts "Describe: #{metadata[:description]}"

    before(:all) do
      print "\n* Before: click on onlyoffice button =>  "
      Login.before_login
    end

    context "domain : #{tl_domain}" do
      puts "Context:  #{metadata[:description]}"

      it 'input portal name' do |it_info|
        print "\n* #{it_info.description} =>  "
        portal_name = login_data_portals[tl_domain]['portal']
        input_text_id('login_enterprise_portal_edit', portal_name)
        click_on_logon_button = click_id 'login_enterprise_next_button'
        sleep 5
        expect(click_on_logon_button).to be_truthy
      end

      type_login = login_data_portals[tl_domain]['email']
      case type_login
      when 'google'
      it 'tap on google button' do |it_info|
        print "\n* #{it_info.description} =>  "
        click_on_account = Login.login_google
        expect(click_on_account).to be_truthy
      end
      when 'facebook'
      it 'tap on facebook button' do |it_info|
        print "\n* #{it_info.description} =>  "
        fb_login = login_data_portals[tl_domain]['fblogin']
        fbp = login_data_portals[tl_domain]['fbp']
        click_on_account = Login.login_facebook(fb_login, fbp)
        expect(click_on_account).to be_truthy
      end
      else
        it 'input data portal' do |it_info|
          print "\n* #{it_info.description} =>  "
          email = login_data_portals[tl_domain]['email']
          pass = login_data_portals[tl_domain]['p']
          input_text_id('login_enterprise_portal_email_edit', email)
          input_text_id('login_enterprise_portal_password_edit', pass)
          click_id 'login_enterprise_signin_button'
          click_on_account = click_id 'accountContainer'
          expect(click_on_account).to be_truthy
        end
      end
    end
  end
end

