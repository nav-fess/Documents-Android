# frozen_string_literal: true

require 'spec_helper'

registration_data = ConfigReader.get 'enterprise_registration_data'

# Iterate by portal regions, e.g. .com, .eu
# Skipping .info portal because need additional key for registration
registration_data.each_key do |region|
  next if region == :info

  # Iterate by portals data
  registration_data[region].each do |portal|
    reg_time = Time.now.strftime '%d%m%y%H%M%S'
    reg_hint = Consts::Registration::REGION_HINT[region.to_sym]

    describe "Registration #{portal[:name]}#{reg_time}#{reg_hint}", :registration, :enterprise, :smoke do
      before :all do
        locale = Consts::Registration::LOCALES[region]
        @test_instance.capabilities[:locale] = locale
        @test_instance.capabilities[:language] = Consts::LOCALES[locale.to_sym][:language]
        @test_instance.restart_driver
        Onboarding.skip_button_click
        CloudList.get_started_button_click
      end

      it 'Open new portal registration form' do
        OnlyofficeEnterpriseLogin.create_portal_button_click
      end

      it 'Check new portal region' do
        current_region = OnlyofficeEnterpriseRegistration.hint_text_value
        expect(current_region).to eq(reg_hint)
      end

      it 'Fill portal name, email, first name, last name fields and press by Next button' do
        OnlyofficeEnterpriseRegistration.portal_name_textfield_fill(portal[:name] + reg_time)
        OnlyofficeEnterpriseRegistration.email_textfield_fill portal[:email]
        OnlyofficeEnterpriseRegistration.first_name_textfield_fill Consts::Registration::FIRST_NAME
        OnlyofficeEnterpriseRegistration.last_name_textfield_fill Consts::Registration::LAST_NAME
        OnlyofficeEnterpriseRegistration.hide_keyboard
        OnlyofficeEnterpriseRegistration.next_button_click
      end

      it 'Fill password, repeat password fields and press by Sign in button' do
        OnlyofficeEnterpriseRegistration.password_textfield_fill portal[:pass]
        OnlyofficeEnterpriseRegistration.password_repeat_textfield_fill portal[:pass]
        OnlyofficeEnterpriseRegistration.sign_in_button_click
      end

      it 'Check account name after login' do
        account_name = CloudTopToolBar.account_title_text_value
        expect(account_name).to eq(Consts::Registration::FIRST_NAME + ' ' + Consts::Registration::LAST_NAME)
      end

      it 'Check portal address after login' do
        portal_address = CloudTopToolBar.account_sub_title_text_value
        expect(portal_address).to eq(portal[:name] + reg_time + reg_hint)
      end
    end
  end
end

registration_data[:info].each do |portal|
  reg_time = Time.now.strftime '%d%m%y%H%M%S'
  reg_hint = Consts::Registration::REGION_HINT[:info]

  describe "Registration #{portal[:name]}#{reg_time}#{reg_hint}", :registration, :info, :smoke do
    before :all do
      Onboarding.skip_button_click
      CloudList.get_started_button_click
    end

    it 'Open new portal registration form' do
      OnlyofficeEnterpriseLogin.create_portal_button_click
    end

    it 'Change portal type to info' do
      OnlyofficeEnterpriseRegistration.portal_name_textfield_fill Consts::Registration::INFO_PORTAL_KEY
    end

    it 'Check new portal region' do
      current_region = OnlyofficeEnterpriseRegistration.hint_text_value
      expect(current_region).to eq(reg_hint)
    end

    it 'Fill portal name, email, first name, last name fields and press by Next button' do
      OnlyofficeEnterpriseRegistration.portal_name_textfield_fill(portal[:name] + reg_time)
      OnlyofficeEnterpriseRegistration.email_textfield_fill portal[:email]
      OnlyofficeEnterpriseRegistration.first_name_textfield_fill Consts::Registration::FIRST_NAME
      OnlyofficeEnterpriseRegistration.last_name_textfield_fill Consts::Registration::LAST_NAME
      OnlyofficeEnterpriseRegistration.next_button_click
    end

    it 'Fill password, repeat password fields and press by Sign in button' do
      OnlyofficeEnterpriseRegistration.password_textfield_fill portal[:pass]
      OnlyofficeEnterpriseRegistration.password_repeat_textfield_fill portal[:pass]
      OnlyofficeEnterpriseRegistration.sign_in_button_click
    end

    it 'Check account name after login' do
      account_name = CloudTopToolBar.account_title_text_value
      expect(account_name).to eq(Consts::Registration::FIRST_NAME + ' ' + Consts::Registration::LAST_NAME)
    end

    it 'Check portal address after login' do
      portal_address = CloudTopToolBar.account_sub_title_text_value
      expect(portal_address).to eq(portal[:name] + reg_time + reg_hint)
    end
  end
end
