require 'appium_lib'
require_relative '../spec/spec_helper.rb'
require_relative '../helpers/helpers.rb'
include Helpers


=begin
example PortalLoginDaga.json:

{
  "personal1": { "email":"email_name","p":"pass"},
  "personal2": { "email":"facebook","fblogin":"email_for_facebook" ,"fbp":"pass_facebook"},
  "personal3": { "email":"google" }
}

domen = eu|sg|info|com|tk
=end

login_data_personal.each_key do |tl_domain|
  describe 'Portal login Personal Without 2FA', login: 'personal' do
    puts "Describe: #{metadata[:description]}"

    before(:all) do
      print "\n* Before: click on onlyoffice button =>  "
      Login.before_login
    end

    context 'Personal:' do
      puts "Context:  #{metadata[:description]}"

      it 'click on personal tab' do |it_info|
        print "\n* #{it_info.description} =>  "
        click_on_tab = click_xpath("*//android.widget.TextView[@text='PERSONAL']")
        expect(click_on_tab).to be_truthy
      end

      type_login = login_data_personal[tl_domain]['email']

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
          fb_login = login_data_personal[tl_domain]['fblogin']
          fbp = login_data_personal[tl_domain]['fbp']
          click_on_account = Login.login_facebook(fb_login, fbp)
          expect(click_on_account).to be_truthy
        end
      else
        it 'input data' do |it_info|
          print "\n* #{it_info.description} =>  "
          email = login_data_personal[tl_domain]['email']
          pass =  login_data_personal[tl_domain]['p']
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


