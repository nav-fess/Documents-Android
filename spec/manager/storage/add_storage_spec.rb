# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigHelper.get('storage_data')

login_data[:enterprise].each do |portal|
  describe "Add storage  to #{portal[:name]}", :add_storage do
    before :all do
      Onboarding.skip_button_click
      CloudList.get_started_button_click
    end

    it 'Login to portral' do
      OnlyofficeEnterpriseLogin.perform portal[:name], portal[:login], portal[:pass]
    end

    portal[:storages].each do |storage|
      it "Add storages #{storage}" do
        PlusFAB.add_storage
        Storage.choice_storage storage
        Search.perform storage[:name]
        storage_exist = Storage.storage? storage[:name]
        expect(storage_exist).to be_truthy
      end
    end

    after :all do
      portal[:storages].each do |storage|
        Search.perform storage[:name]
        CloudFileList.folder_context_button_click
        ContextMenu.remove_button_click
        Dialog.accept_button_click
        2.back
      end
      2.back
    end
  end
end

login_data[:personal].each do |portal|
  describe "Add storage to Personal", :add_storage do
    before :all do
      Onboarding.skip_button_click
      CloudList.get_started_button_click
    end

    it 'Login to Personal' do
      OnlyofficePersonalLogin.perform portal[:login], portal[:pass]
    end

    portal[:storages].each do |storage|
      it "Add storages #{storage}" do
        PlusFAB.add_storage
        Storage.choice_storage storage
        Search.perform storage[:name]
        storage_exist = Storage.storage? storage[:name]
        expect(storage_exist).to be_truthy
      end
    end

    after :all do
      portal[:storages].each do |storage|
        Search.perform storage[:name]
        CloudFileList.folder_context_button_click
        ContextMenu.remove_button_click
        Dialog.accept_button_click
        2.back
      end
      2.back
    end
  end
end
