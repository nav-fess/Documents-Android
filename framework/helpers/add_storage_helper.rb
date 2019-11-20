# frozen_string_literal: true

require_relative '../../framework/constants/id.rb'
require_relative '../../framework/constants/const_index.rb'
require_relative '../../framework/tools/appium_extension.rb'
require_relative '../../spec/spec_helper.rb'
include AppiumExtension
include Helpers

# Module contain different classes of help
module Helpers
  # Class contain different methods for adding storages
  class AddStorage
    def self.google_drive(login, pass)
      click text: ConstIndex::GOOGLE_STORAGE, pause: 6
      fill_form textfield: ConstIndex::GOOGLE_EMAIL,
                data: login

      click button: ConstIndex::GOOGLE_NEXT_ONE
      fill_form textfield: ConstIndex::GOOGLE_PASS_STORAGE,
                data: pass, pause: 3

      click button: ConstIndex::GOOGLE_NEXT_TWO
      click button: ConstIndex::GOOGLE_NEXT_THREE, pause: 4
      put_back
      click id: ID::CONNECT_SAVE
    end

    def self.one_drive(login, pass)
      click text: ConstIndex::ONEDRIVE_STORAGE, pause: 6
      fill_form textfield: ConstIndex::ONEDRIVE_LOGIN,
                data: login, pause: 3

      click button: ConstIndex::ONEDRIVE_NEXT_ONE
      fill_form textfield: ConstIndex::ONEDRIVE_PASS,
                data: pass, pause: 3

      click button: ConstIndex::ONEDRIVE_NEXT_TWO, pause: 3
      put_back
      click id: ID::CONNECT_SAVE
    end

    def self.dropbox(login, pass)
      click text: ConstIndex::DROPBOX_STORAGE, pause: 6
      click button: ConstIndex::SIGNIN_WITH_GOOGLE, pause: 5
      fill_form textfield: ConstIndex::GOOGLE_EMAIL,
                data: login, pause: 3

      click button: ConstIndex::GOOGLE_NEXT_ONE
      fill_form textfield: ConstIndex::GOOGLE_PASS_STORAGE,
                data: pass, pause: 3
      click button: ConstIndex::GOOGLE_NEXT_TWO, pause: 2
      put_back
      click id: ID::CONNECT_SAVE, pause: 4
    end

    def self.yandex_disk(login, pass)
      click text: ConstIndex::YANDEX_STORAGE, pause: 6
      fill_form  id: ID::CLOUD_LOGIN, data: login
      fill_form  id: ID::CLOUD_PASS, data: pass
      click id: ID::CLOUD_SAVE, pause: 3
    end

    def self.box(login, pass)
      click text: ConstIndex::BOX_STORAGE, pause: 6
      fill_form textfield: ConstIndex::BOX_EMAIL,
                data: login, pause: 3

      fill_form textfield: ConstIndex::BOX_PASS,
                data: pass, pause: 3

      click button: ConstIndex::BOX_AUTHORIZE, pause: 2
      click button: ConstIndex::BOX_ACCESS, pause: 2
      put_back
      click id: ID::CONNECT_SAVE, pause: 4
    end

    def self.owncloud(portal, login, pass)
      click text: ConstIndex::OWNCLOUD, pause: 6
      Login.login_cloud(portal, login, pass)
    end

    def self.nextcloud(portal, login, pass)
      click text: ConstIndex::NEXTCLOUD, pause: 6
      Login.login_cloud(portal, login, pass)
    end

    def self.webdav(portal, login, pass)
      click text: ConstIndex::WEBDAV, pause: 6
      Login.login_cloud(portal, login, pass)
    end

    def self.sharepoint(portal, login, pass)
      click text: ConstIndex::WEBDAV, pause: 6
      Login.login_cloud(portal, login, pass)
    end

    def self.put_back
      sleep 7
      hardback if (elements id: ID::CONNECT_SAVE).empty?
    end
  end
end
