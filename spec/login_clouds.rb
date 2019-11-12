# frozen_string_literal: true

require 'appium_lib'
require_relative '../spec/spec_helper.rb'
require_relative '../helpers/helpers.rb'
include Helpers

login_data_clouds.each_key do |tl_domain|
  describe 'Cloud login', login: 'cloud' do
    puts "Describe: #{metadata[:description]}"

    before(:all) do
      print "\n* Before: click on onlyoffice button =>  "
      Login.before_login
    end

    context "#{tl_domain}:" do
    puts "Context: #{ metadata[:description] }"

    it 'click on button cloud' do |it_info|
      print "\n* #{it_info.description} =>  "
      case tl_domain
      when 'nextcloud' then click_id 'cloudsItemNextCloud'
      when 'owncloud'  then click_id 'cloudsItemOwnCloud'
      when 'webdav'    then click_id 'cloudsItemWebDav'
      end
    end

    it 'input data cloud' do |it_info|
      print "\n* #{it_info.description} =>  "
      portal = login_data_clouds[tl_domain]['portal']
      login  = login_data_clouds[tl_domain]['login']
      pass   = login_data_clouds[tl_domain]['p']
      element_exist = Login.login_cloud(portal, login, pass)
      expect(element_exist).to be_truthy
    end
    end
  end
end
