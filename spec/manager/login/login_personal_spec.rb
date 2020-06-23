# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigHelper.get('personal_login_data')

login_data[:personal].each do |portal|
  describe 'Login to personal', :login, :personal, :smoke do
    before :all do
      Onboarding.skip_button_click
      CloudList.get_started_button_click
    end

    it('Personal : Choice Personal portal type') do
      PortalTypeSwitcher.personal_button_click
    end

    it 'Personal : Input user data' do
      OnlyofficePersonalLogin.email_textfield_fill portal[:login]
      OnlyofficePersonalLogin.password_textfield_fill portal[:pass]
    end

    it('Personal : Sign In') { OnlyofficePersonalLogin.sign_in_button_click }

    it 'Personal : Check the portal address after login ' do
      expected_portal = CloudTopToolBar.account_sub_title_text_value
      expect(expected_portal).to eq('personal.onlyoffice.com')
    end
  end
end

login_data[:google].each do
  describe 'Login through Google to personal', :login, :personal, :smoke do
    before :all do
      Onboarding.skip_button_click
      CloudList.get_started_button_click
    end

    it('Personal : Choice portal type') do
      PortalTypeSwitcher.personal_button_click
    end

    it 'Personal : Tap Google account' do
      OnlyofficePersonalLogin.google_button_click
      sleep 2
      OnlyofficePersonalLogin.google_account_button_click
    end

    it 'Personal : Check the portal address after login ' do
      expected_portal = CloudTopToolBar.account_sub_title_text_value
      expect(expected_portal).to eq('personal.onlyoffice.com')
    end
  end
end

login_data[:facebook].each do |portal|
  describe 'Login through Facebook to personal', :login, :personal, :smoke do
    before :all do
      Onboarding.skip_button_click
      CloudList.get_started_button_click
    end

    it('Personal : Choice Personal portal type') do
      PortalTypeSwitcher.personal_button_click
    end

    it 'Personal : Tap Facebook account' do
      OnlyofficePersonalLogin.facebook_button_click
      OnlyofficePersonalLogin.fb_login_textfield_fill portal[:login], delay: 5
      OnlyofficePersonalLogin.fb_pass_textfield_fill  portal[:pass]
      OnlyofficePersonalLogin.fb_log_in_button_click
      OnlyofficePersonalLogin.continue_button_click delay: 2
    end

    it 'Personal : Check the portal address after login ' do
      expected_portal = CloudTopToolBar.account_sub_title_text_value
      expect(expected_portal).to eq('personal.onlyoffice.com')
    end
  end
end
