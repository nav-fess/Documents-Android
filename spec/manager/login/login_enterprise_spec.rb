# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigReader.get('portal_login_data')

login_data[:enterprise].each do |portal|
  describe "Login to #{portal[:portal]}", :login, :enterprise, :smoke do
    it('Skip onboarding') { Onboarding.skip_button_click }
    it('Choice Onlyoffice login') { CloudList.onlyoffice_button_click }

    it 'Input portal address' do
      OnlyofficeEnterpriseLogin.portal_address_textfield_fill portal[:portal]
      OnlyofficeEnterpriseLogin.next_button_click
    end

    it 'Input user data' do
      OnlyofficeEnterpriseLogin.email_textfield_fill portal[:login]
      OnlyofficeEnterpriseLogin.password_textfield_fill portal[:pass]
    end

    it 'Sign In' do
      OnlyofficeEnterpriseLogin.sign_in_button_click
    end

    it 'Check the portal address after login ' do
      expected_portal = CloudTopToolBar.account_sub_title_text_value
      expect(expected_portal).to eq(portal[:portal])
    end
  end
end
