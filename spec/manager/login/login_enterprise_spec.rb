# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigHelper.get('enterprise_login_data')

login_data[:enterprise].each do |portal|
  describe "Login to #{portal[:name].split('.')[-1]}", :enterprise do
    domain = portal[:name].split('.')[-1]

    before :all do
      Onboarding.skip_button_click
      CloudList.get_started_button_click
    end

    it "#{domain} : Input portal address" do
      OnlyofficeEnterpriseLogin.portal_address_textfield_fill portal[:name]
      OnlyofficeEnterpriseLogin.next_button_click
    end

    it "#{domain} : Input user data" do
      OnlyofficeEnterpriseLogin.email_textfield_fill portal[:login]
      OnlyofficeEnterpriseLogin.password_textfield_fill portal[:pass]
    end

    it("#{domain} : Sign In") { OnlyofficeEnterpriseLogin.sign_in_button_click }

    it "#{domain} : Check the portal address after login" do
      expected_portal = CloudTopToolBar.account_sub_title_text_value time: 15
      expect(portal[:name].to_s).to include(expected_portal.to_s)
    end
  end
end

login_data[:google].each do |portal|
  describe "Login via Google to #{portal[:name].split('.')[-1]}", :enterprise do
    domain = portal[:name].split('.')[-1]

    before :all do
      Onboarding.skip_button_click
      CloudList.get_started_button_click
    end

    it "#{domain} : Input portal address" do
      OnlyofficeEnterpriseLogin.portal_address_textfield_fill portal[:name]
      OnlyofficeEnterpriseLogin.next_button_click
    end

    it "#{domain} : Tap Google account" do
      OnlyofficeEnterpriseLogin.google_button_click
      OnlyofficeEnterpriseLogin.google_account_button_click delay: 2
    end

    it "#{domain} : Check the portal address after login" do
      expected_portal = CloudTopToolBar.account_sub_title_text_value time: 18
      expect(portal[:name].to_s).to include(expected_portal.to_s)
    end
  end
end

login_data[:facebook].each do |portal|
  describe "Login via Facebook to #{portal[:name].split('.')[-1]}", :enterprise do
    domain = portal[:name].split('.')[-1]

    before :all do
      Onboarding.skip_button_click
      CloudList.get_started_button_click
    end

    it "#{domain} : Input portal address" do
      OnlyofficeEnterpriseLogin.portal_address_textfield_fill portal[:name]
      OnlyofficeEnterpriseLogin.next_button_click
    end

    it "#{domain} : Tap Facebook account" do
      OnlyofficeEnterpriseLogin.facebook_button_click
      OnlyofficeEnterpriseLogin.fb_login_textfield_fill portal[:login], delay: 2
      OnlyofficeEnterpriseLogin.fb_pass_textfield_fill portal[:pass]
      OnlyofficeEnterpriseLogin.fb_log_in_button_click
      OnlyofficeEnterpriseLogin.continue_button_click delay: 2
    end

    it "#{domain} : Check the portal address after login" do
      expected_portal = CloudTopToolBar.account_sub_title_text_value time: 15
      expect(portal[:name].to_s).to include(expected_portal.to_s)
    end
  end
end
