# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigHelper.get('cloud_login_data')

login_data[:owncloud].each do |portal|
  describe 'Login to clouds OwnCloud', :cloud do
    before :all do
      Onboarding.skip_button_click
      CloudList.other_storage_button_click
    end

    after :all do
      BottomNavigationBar.profile_button_click
      Account.context_button_click
      ContextAccount.remove_button_click
      Dialog.accept_button_click
    end

    it 'OwnCloud : Input name, login and pass cloud' do
      CloudList.owncloud_button_click
      OwnCloud.url_owncloud_textfield_fill   portal[:name]
      OwnCloud.login_owncloud_textfield_fill portal[:login]
      OwnCloud.pass_owncloud_textfield_fill  portal[:pass]
      hide_keyboard delay: 1
      OwnCloud.authorize_owncloud_button_click delay: 2
    end

    it 'OwnCloud : Check the cloud address after login' do
      expected_portal = CloudTopToolBar.account_sub_title_text_value time: 30
      expected_portal = expected_portal.split('/')[0]
      expect(portal[:name].to_s).to include(expected_portal.to_s)
    end
  end
end

login_data[:nextcloud].each do |portal|
  describe 'Login to clouds Nextcloud', :cloud do
    before :all do
      Onboarding.skip_button_click
      CloudList.other_storage_button_click
    end

    after :all do
      BottomNavigationBar.profile_button_click
      Account.context_button_click
      ContextAccount.remove_button_click
      Dialog.accept_button_click
    end

    it 'Nextcloud : Input name cloud' do
      CloudList.nextcloud_button_click
      NextCloud.url_nextcloud_textfield_fill portal[:name]
      NextCloud.authorize_nextcloud_button_click
      NextCloud.login_fmame_nc_button_click time: 60
    end

    it 'Nextcloud : Input login and pass' do
      NextCloud.user_frame_nc_textfields[0].send_keys portal[:login]
      NextCloud.pass_frame_nc_textfields[1].send_keys portal[:pass]
      NextCloud.login_frame_next_nc_button_click time: 5
      NextCloud.access_frame_nc_button_click delay: 30, time: 5
    end

    it 'Nextcloud : Check the cloud address after login' do
      expected_portal = CloudTopToolBar.account_sub_title_text_value time: 60
      expected_portal = expected_portal.split('/')[0]
      expect(portal[:name].to_s).to include(expected_portal.to_s)
    end
  end
end

login_data[:webdav].each do |portal|
  describe 'Login to  clouds Webdav ', :cloud do
    before :all do
      Onboarding.skip_button_click
      CloudList.other_storage_button_click
    end

    after :all do
      BottomNavigationBar.profile_button_click
      Account.context_button_click
      ContextAccount.remove_button_click
      Dialog.accept_button_click
    end

    it 'Webdav : Input name, login and pass cloud' do
      CloudList.webdav_button_click
      WebDAV.url_webdav_textfield_fill     portal[:name]
      WebDAV.login_webdav_textfield_fill   portal[:login]
      WebDAV.pass_webdav_textfield_fill    portal[:pass]
      hide_keyboard delay: 1
      WebDAV.authorize_webdav_button_click
    end

    it 'Webdav : Check the cloud address after login' do
      expected_portal = CloudTopToolBar.account_sub_title_text_value
      expect(portal[:name].to_s).to include(expected_portal.to_s)
    end
  end
end
