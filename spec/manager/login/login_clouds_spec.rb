# frozen_string_literal: true

require 'appium_lib'
require_relative '../spec/ec_helper.rb'
require_relative '../framework/helpers/login_helpers.rb'
require_relative '../framework/tools/appium_extension.rb'
require_relative '../framework/constants/id.rb'
include Helpers
include AppiumExtension

login_data_clouds.each_key do |tl_domain|
  describe 'Cloud login', login: 'cloud' do
    puts "Describe: #{metadata[:description]}"

    before(:all) do
      print "\n* Before: click on onlyoffice button =>  "
      Login.before_login
    end

    context "#{tl_domain}:" do
      puts "Context: #{metadata[:description]}"

      it 'click on button cloud' do |it_info|
        print "\n* #{it_info.description} =>  "
        case tl_domain
        when 'nextcloud' then click id: ID::NEXTCLOUD
        when 'owncloud'  then click id: ID::OWNCLOUD
        when 'webdav'    then click id: ID::WEBDAV
        else puts 'Other cloud'
        end
      end

      it 'input data cloud' do |it_info|
        print "\n* #{it_info.description} =>  "
        portal = login_data_clouds[tl_domain]['portal']
        login  = login_data_clouds[tl_domain]['login']
        pass   = login_data_clouds[tl_domain]['p']
        Login.login_cloud(portal, login, pass)
        element_exist = element id: ID::ACCOUNTS
        expect(element_exist).to be_truthy
      end
    end
  end
end
