# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigHelper.get('cloud_login_data')

login_data[:owncloud].each do |portal|
  describe "login to OwnCloud on #{portal[:name]}", :cloud do
    before :all do
      Onboarding.skip_button_click
      CloudList.other_storage_button_click
    end

    it 'Login to OwnCloud' do
      CloudList.owncloud_button_click
      OwnCloud.url_owncloud_textfield_fill   portal[:name]
      OwnCloud.login_owncloud_textfield_fill portal[:login]
      OwnCloud.pass_owncloud_textfield_fill  portal[:pass]
      OwnCloud.authorize_owncloud_button_click time: 10
    end

    it 'Check the cloud address after login ' do
      expected_portal = CloudTopToolBar.account_sub_title_text_value time: 30
      expect(portal[:name].to_s).to include(expected_portal.to_s)
    end

    after :all do
      BottomNavigationBar.profile_button_click
      Account.context_button_click
      ContextAccount.remove_button_click
      DeleteAccount.delete_button_click
    end
  end
end

login_data[:nextcloud].each do |portal|
  describe "login to Nextcloud on #{portal[:name]}", :cloud do
    before :all do
      Onboarding.skip_button_click
      CloudList.other_storage_button_click
    end

    it 'Login to Nextcloud' do
      CloudList.nextcloud_button_click
      NextCloud.url_nextcloud_textfield_fill portal[:name]
      NextCloud.authorize_nextcloud_button_click
      NextCloud.login_fmame_nc_button_click time: 60
      NextCloud.user_frame_nc_textfield_fill portal[:login]
      NextCloud.pass_frame_nc_textfield_fill portal[:pass]
      NextCloud.login_frame_next_nc_button_click time: 5
      NextCloud.access_frame_nc_button_click delay: 30, time: 5
    end

    it 'Check the cloud address after login ' do
      expected_portal = CloudTopToolBar.account_sub_title_text_value time: 60
      expect(portal[:name].to_s).to include(expected_portal.to_s)
    end

    after :all do
      BottomNavigationBar.profile_button_click
      Account.context_button_click
      ContextAccount.remove_button_click
      DeleteAccount.delete_button_click
    end
  end
end

login_data[:webdav].each do |portal|
  describe "login to Webdav on cloud #{portal[:name]}", :cloud do
    before :all do
      Onboarding.skip_button_click
      CloudList.other_storage_button_click
    end

    it 'Login to cloud webdav' do
      CloudList.webdav_button_click
      WebDAV.url_webdav_textfield_fill     portal[:name]
      WebDAV.login_webdav_textfield_fill   portal[:login]
      WebDAV.pass_webdav_textfield_fill    portal[:pass]
      WebDAV.authorize_webdav_button_click
    end

    it 'Check the cloud address after login ' do
      expected_portal = CloudTopToolBar.account_sub_title_text_value
      expect(portal[:name].to_s).to include(expected_portal.to_s)
    end

    after :all do
      BottomNavigationBar.profile_button_click
      Account.context_button_click
      ContextAccount.remove_button_click
      DeleteAccount.delete_button_click
    end
  end
end


