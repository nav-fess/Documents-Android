# frozen_string_literal: true

require 'appium_lib'
require_relative '../spec/ec_helper.rb'
require_relative '../framework/helpers/login_helpers'
require_relative '../framework/constants/id.rb'
require_relative '../framework/tools/appium_extension.rb'
include Helpers
include AppiumExtension

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
        click id: ID::CLOUDS_MENU_ITEM
      end

      it 'input portal name' do |it_info|
        print "\n* #{it_info.description} =>  "
        portal_name = login_data_portals[tl_domain]['portal']
        fill_form id: ID::ENTERPRISE_PORTAL, data: portal_name
        click_on_logon_button = click id: ID::ENTERPRISE_NEXT
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
          fill_form id: ID::ENTERPRISE_EMAIL, data: email
          fill_form id: ID::ENTERPRISE_PASSWORD, data: pass
          click id: ID::ENTERPRISE_SIGN_IN
          element_exist = element id: ID::ACCOUNTS
          expect(element_exist).to be_truthy
        end
      end
    end
  end
end
