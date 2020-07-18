# frozen_string_literal: true

require 'spec_helper'

registration_data = ConfigHelper.get 'enterprise_registration_data'

registration_data.each_key do |region|
  registration_data[region].each do |portal|
    describe "Registration portal at #{region}", :registration, :smoke do
      let(:instance) { @test_instance }
      let(:hint) { Consts::Registration::REGION_HINT[region.to_sym] }
      let(:time) { Time.now.strftime '%m%y%H' }

      it "#{region} : Update capabilities if .info" do
        if region != :info
          locale = Consts::Registration::LOCALES[region]
          instance.update_capabilities locale: locale,
                                       language: Consts::LOCALES[locale.to_sym][:language]
          instance.restart_driver
        end
      end

      it "#{region} : Preparatory capabilities" do
        Onboarding.skip_button_click
        CloudList.get_started_button_click
      end

      it "#{region} : Open portal registration form" do
        OnlyofficeEnterpriseLogin.create_portal_button_click delay: 2
      end

      it "#{region} : input key info" do
        if region == :info
          OnlyofficeEnterpriseRegistration
            .portal_name_textfield_fill Consts::Registration::INFO_PORTAL_KEY
        end
      end

      it "#{region} : input portal name" do
        OnlyofficeEnterpriseRegistration
          .portal_name_textfield_fill portal[:name] + time
      end

      it "#{region} : Fill email, first name and last name" do
        OnlyofficeEnterpriseRegistration.email_textfield_fill portal[:login]
        OnlyofficeEnterpriseRegistration
          .first_name_textfield_fill Consts::Registration::FIRST_NAME
        OnlyofficeEnterpriseRegistration
          .last_name_textfield_fill Consts::Registration::LAST_NAME
      end

      it "#{region} : Press by Next button" do
        hide_keyboard unless
          instance.capabilities[:deviceName].downcase.include? 'emulator'
        OnlyofficeEnterpriseRegistration.next_button_click
      end

      it "#{region} : Fill password, repeat password and press by Sign in button" do
        OnlyofficeEnterpriseRegistration.password_textfield_fill portal[:pass]
        OnlyofficeEnterpriseRegistration
          .password_repeat_textfield_fill portal[:pass]
        OnlyofficeEnterpriseRegistration.sign_in_button_click
      end

      it "#{region} : Check account name after login" do
        account_name = CloudTopToolBar.account_title_text_value
        expected_name = Consts::Registration::FIRST_NAME + ' ' + Consts::Registration::LAST_NAME
        expect(account_name).to eq(expected_name)
      end

      it "#{region} : Check portal address after login" do
        portal_address = CloudTopToolBar.account_sub_title_text_value
        expected_address = portal[:name] + time + hint
        expect(portal_address).to eq(expected_address)
      end
    end
  end
end
