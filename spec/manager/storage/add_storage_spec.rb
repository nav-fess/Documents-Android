# frozen_string_literal: true

require 'spec_helper'

login_data = ConfigHelper.get('storage_data')

login_data[:enterprise].each do |portal|
  describe "Add storage  to #{portal[:portal]}", :add_storage do
    before :all do
      Onboarding.skip_button_click
      CloudList.get_started_button_click
    end

    it 'Login to protral' do
      OnlyofficeEnterpriseLogin.perform portal[:portal], portal[:login], portal[:pass]
    end

    portal[:storages].each do |storage|
      it "Add storages #{storage}" do
        PlusFAB.add_storage
        puts "storage = #{storage[:storage]}"
        Storage.choice_storage storage
        Search.perform storage[:storage]
        storage_exist = Storage.storage? storage[:storage]
        expect(storage_exist).to be_truthy
      end
    end

    after :all do
      portal[:storages].each do |storage|
        Search.perform storage[:storage]
        CloudFileList.folder_context_button_click
        ContextMenu.remove_button_click
        Dialog.accept_button_click
        2.back
      end
      2.back
    end
  end
end
