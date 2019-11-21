# frozen_string_literal: true

require_relative '../../../spec/spec_helper.rb'
include AppiumExtension

login_data_clouds.each_key do |tl_domain|
  describe 'Cloud login', login: 'cloud' do
    before(:all) do
      Login.before_login
    end

    context "#{tl_domain}:" do
      it 'click on button cloud' do
        case tl_domain
        when 'nextcloud' then click id: ID::NEXTCLOUD
        when 'owncloud'  then click id: ID::OWNCLOUD
        when 'webdav'    then click id: ID::WEBDAV
        else puts 'Other cloud'
        end
      end

      it 'input data cloud' do
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
