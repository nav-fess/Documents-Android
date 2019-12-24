# frozen_string_literal: true

require 'spec_helper'

login_data_clouds = AuthDataTools.parse_json('CloudLoginData.json')

login_data_clouds.each do |domain, data_clouds|
  data_clouds.each do |data|
    describe 'Cloud login', login: 'cloud' do
      before(:all) do
        Login.before_login
      end

      context "#{domain}:" do
        it 'click on button cloud' do
          case domain
          when 'nextcloud' then Login.tap_on_nextcloud
          when 'owncloud'  then Login.tap_on_owncloud
          when 'webdav'    then Login.tap_on_webdav_cloud
          else puts 'Other cloud'
          end
        end

        it 'input data cloud' do
          portal = data['portal']
          login  = data['login']
          pass   = data['pass']
          Login.login_cloud(portal, login, pass)
          Helpers.screen('Cloud login', domain)
          element_exist = Login.find_accounts
          expect(element_exist).to be_truthy
        end
      end
    end
  end
end
