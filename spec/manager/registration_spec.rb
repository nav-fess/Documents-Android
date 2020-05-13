# frozen_string_literal: true

require 'spec_helper'

registration_data = ConfigHelper.get 'enterprise_registration_data'

registration_data.each_key do |region|
  registration_data[region].each do |portal|
    describe "Registration portal at #{region}", :registration, :smoke do
      before :all do
        if region != :info
          locale = Consts::Registration::LOCALES[region]
          @test_instance.update_capabilities locale: locale,
                                             language: Consts::LOCALES[locale.to_sym][:language]
          @test_instance.restart_driver
        end

        Onboarding.skip_button_click
        CloudList.get_started_button_click
        @reg_hint = Consts::Registration::REGION_HINT[region.to_sym]
        @reg_time = Time.now.strftime '%d%m%y%H%M%S'
      end

      it 'Open portal registration form' do
        OnlyofficeEnterpriseLogin.create_portal_button_click
      end

      it 'Fill portal name' do
        if region == :info
          OnlyofficeEnterpriseRegistration.portal_name_textfield_fill Consts::Registration::INFO_PORTAL_KEY
        end

        OnlyofficeEnterpriseRegistration.portal_name_textfield_fill portal[:name] + @reg_time
      end

      it 'Fill email, first name and last name' do
        OnlyofficeEnterpriseRegistration.email_textfield_fill portal[:email]
        OnlyofficeEnterpriseRegistration.first_name_textfield_fill Consts::Registration::FIRST_NAME
        OnlyofficeEnterpriseRegistration.last_name_textfield_fill Consts::Registration::LAST_NAME
      end

      it 'Press by Next button' do
        hide_keyboard unless @test_instance.capabilities[:deviceName].downcase.include? 'emulator'
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
        expect(portal_address).to eq(portal[:name] + @reg_time + @reg_hint)
      end
    end
  end
end
