# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigHelper.get('personal_login_data')

login_data[:personal].each do |portal|
  describe "Login to personal #{portal[:login]}", :login, :personal, :smoke do
    before :all do
      Onboarding.skip_button_click
      CloudList.get_started_button_click
    end

    it('Choice Personal portal type') do
      PortalTypeSwitcher.personal_button_click
    end

    it 'Input user data' do
      OnlyofficePersonalLogin.email_textfield_fill portal[:login]
      OnlyofficePersonalLogin.password_textfield_fill portal[:pass]
    end

    it('Sign In') { OnlyofficePersonalLogin.sign_in_button_click }

    it 'Check the portal address after login ' do
      expected_portal = CloudTopToolBar.account_sub_title_text_value
      expect(expected_portal).to eq('personal.onlyoffice.com')
    end
  end
end

login_data[:google].each do |portal|
  describe "Login through Google to personal #{portal[:login]}", :login, :personal, :smoke do
    before :all do
      Onboarding.skip_button_click
      CloudList.get_started_button_click
    end

    it('Choice Personal portal type') do
      PortalTypeSwitcher.personal_button_click
    end

    it 'Tap Google account' do
      OnlyofficePersonalLogin.google_button_click
      sleep 2
      OnlyofficePersonalLogin.google_account_button_click
    end

    it 'Check the portal address after login ' do
      expected_portal = CloudTopToolBar.account_sub_title_text_value
      expect(expected_portal).to eq('personal.onlyoffice.com')
    end
  end
end

login_data[:facebook].each do |portal|
  describe "Login through Facebook to personal #{portal[:login]}", :login, :personal, :smoke do
    before :all do
      Onboarding.skip_button_click
      CloudList.get_started_button_click
    end

    it('Choice Personal portal type') do
      PortalTypeSwitcher.personal_button_click
    end

    it 'Tap Facebook account' do
      OnlyofficePersonalLogin.facebook_button_click
      OnlyofficePersonalLogin.fb_login_textfield_fill portal[:login]
      OnlyofficePersonalLogin.fb_pass_textfield_fill  portal[:pass]
      OnlyofficePersonalLogin.fb_log_in_button_click
      sleep 2
      OnlyofficePersonalLogin.continue_button_click
    end

    it 'Check the portal address after login ' do
      expected_portal = CloudTopToolBar.account_sub_title_text_value
      expect(expected_portal).to eq('personal.onlyoffice.com')
    end
  end
end
