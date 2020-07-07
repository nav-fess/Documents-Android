# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigHelper.get('storage_data')

login_data[:enterprise].each do |portal|
  describe 'Add storage', :add_storage do
    domain = portal[:name].split('.')[-1]

    before :all do
      Onboarding.skip_button_click
      CloudList.get_started_button_click
    end

    after :all do
      portal[:storages].each do |storage|
        Search.perform storage[:name]
        CloudFileList.folder_context_button_click
        ContextMenu.remove_button_click
        Dialog.accept_button_click
        back
      end
    end

    it "#{domain} : Login to portral" do
      OnlyofficeEnterpriseLogin.add_cloud portal
    end

    portal[:storages].each do |storage|
      it "#{domain}: Add storage #{storage[:name]}" do
        PlusFAB.add_storage
        Storage.choice_storage storage
        Search.perform storage[:name]
        storage_exist = Storage.storage? storage[:name]
        expect(storage_exist).to be_truthy
      end
    end
  end
end

login_data[:personal].each do |portal|
  describe 'Add storage to Personal', :add_storage do
    before :all do
      Onboarding.skip_button_click
      CloudList.get_started_button_click
    end

    after :all do
      portal[:storages].each do |storage|
        Search.perform storage[:name]
        CloudFileList.folder_context_button_click
        ContextMenu.remove_button_click
        Dialog.accept_button_click
        back
      end
    end

    it 'Personal : Login' do
      OnlyofficePersonalLogin.add_cloud portal
    end

    portal[:storages].each do |storage|
      it "Personal : Add storage #{storage[:name]}" do
        PlusFAB.add_storage
        Storage.choice_storage storage
        Search.perform storage[:name]
        storage_exist = Storage.storage? storage[:name]
        expect(storage_exist).to be_truthy
      end
    end
  end
end
