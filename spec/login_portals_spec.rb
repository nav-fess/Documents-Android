# frozen_string_literal: true

=begin
example PortalLoginDaga.json:

{
  "domen": { "portal":"portal_name","email":"email_name","p":"pass"},
  "domen": { "portal":"portal_name","email":"facebook","fblogin":"email_for_facebook" ,"fbp":"pass_facebook"},
  "domen": { "portal":"portal_name","email":"google"},
}

domen = Personal|Personal2|...|Personaln
=end

require 'appium_lib'
require_relative '../spec/spec_helper.rb'
require_relative '../helpers/helpers.rb'
include Helpers

login_data_portals.each_key do |tl_domain|
  describe 'Portal login portals Without 2FA', login: 'portals' do
    puts "Describe: #{metadata[:description]}"

    before(:all) do
      print "\n* Before: click on onlyoffice button =>  "
      Login.before_login
    end

    context "domain : #{tl_domain}" do
      puts "Context:  #{metadata[:description]}"

      it 'click on button portal' do |it_info|
        print "\n* #{it_info.description} =>  "
        click_id 'cloudsItemOnlyOffice'
      end

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
        element_exist = Login.login_google
        expect(element_exist).to be_truthy
      end
      when 'facebook'
      it 'tap on facebook button' do |it_info|
        print "\n* #{it_info.description} =>  "
        fb_login = login_data_portals[tl_domain]['fblogin']
        fbp = login_data_portals[tl_domain]['fbp']
        element_exist = Login.login_facebook(fb_login, fbp)
        expect(element_exist).to be_truthy
      end
      else
        it 'input data portal' do |it_info|
          print "\n* #{it_info.description} =>  "
          email = login_data_portals[tl_domain]['email']
          pass = login_data_portals[tl_domain]['p']
          input_text_id('login_enterprise_portal_email_edit', email)
          input_text_id('login_enterprise_portal_password_edit', pass)
          click_id 'login_enterprise_signin_button'
          element_exist = find_id 'accountContainer'
          expect(element_exist).to be_truthy
        end
      end
    end
  end
end

