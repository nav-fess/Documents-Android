# frozen_string_literal: true

require_relative '../../../spec/spec_helper.rb'

login_data_clouds.each do |domain, data_clouds|
  data_clouds.each do |data|
    describe 'Cloud login', login: 'cloud' do
      before(:all) do
        Login.before_login
      end

      context "#{domain}:" do
        it 'click on button cloud' do
          case domain
          when 'nextcloud' then click id: ID::NEXTCLOUD
          when 'owncloud'  then click id: ID::OWNCLOUD
          when 'webdav'    then click id: ID::WEBDAV
          else puts 'Other cloud'
          end
        end

        it 'input data cloud' do
          portal = data['portal']
          login  = data['login']
          pass   = data['pass']
          Login.login_cloud(portal, login, pass)
          element_exist = element id: ID::ACCOUNTS
          expect(element_exist).to be_truthy
        end
      end
    end
  end
end
