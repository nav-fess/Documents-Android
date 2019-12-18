# frozen_string_literal: true

require_relative '../../spec/spec_helper.rb'

# Module contain different classes of help
module Helpers
  # Class contain different methods for adding storages
  class AddStorage
    def self.google_drive(login, pass)
      click text: IndexUI::GOOGLE_STORAGE, pause: 6
      fill_form textfield: IndexUI::GOOGLE_EMAIL,
                data: login

      click button: IndexUI::GOOGLE_NEXT_ONE
      fill_form textfield: IndexUI::GOOGLE_PASS_STORAGE,
                data: pass, pause: 3

      click button: IndexUI::GOOGLE_NEXT_TWO
      click button: IndexUI::GOOGLE_NEXT_THREE, pause: 4
      put_back
      click id: ID::CONNECT_SAVE
    end

    def self.one_drive(login, pass)
      click text: IndexUI::ONEDRIVE_STORAGE, pause: 6
      fill_form textfield: IndexUI::ONEDRIVE_LOGIN,
                data: login, pause: 3

      click button: IndexUI::ONEDRIVE_NEXT_ONE
      fill_form textfield: IndexUI::ONEDRIVE_PASS,
                data: pass, pause: 3

      click button: IndexUI::ONEDRIVE_NEXT_TWO, pause: 3
      put_back
      click id: ID::CONNECT_SAVE
    end

    def self.dropbox(login, pass)
      click text: IndexUI::DROPBOX_STORAGE, pause: 6
      click button: IndexUI::SIGNIN_WITH_GOOGLE, pause: 5
      fill_form textfield: IndexUI::GOOGLE_EMAIL,
                data: login, pause: 3

      click button: IndexUI::GOOGLE_NEXT_ONE
      fill_form textfield: IndexUI::GOOGLE_PASS_STORAGE,
                data: pass, pause: 3
      click button: IndexUI::GOOGLE_NEXT_TWO, pause: 2
      put_back
      click id: ID::CONNECT_SAVE, pause: 4
    end

    def self.yandex_disk(login, pass)
      click text: IndexUI::YANDEX_STORAGE, pause: 6
      fill_form  id: ID::CLOUD_LOGIN, data: login
      fill_form  id: ID::CLOUD_PASS, data: pass
      click id: ID::CLOUD_SAVE, pause: 3
    end

    def self.box(login, pass)
      click text: IndexUI::BOX_STORAGE, pause: 6
      fill_form textfield: IndexUI::BOX_EMAIL,
                data: login, pause: 3

      fill_form textfield: IndexUI::BOX_PASS,
                data: pass, pause: 3

      click button: IndexUI::BOX_AUTHORIZE, pause: 2
      click button: IndexUI::BOX_ACCESS, pause: 2
      put_back
      click id: ID::CONNECT_SAVE, pause: 4
    end

    def self.owncloud(portal, login, pass)
      click text: IndexUI::OWNCLOUD, pause: 6
      Login.login_cloud(portal, login, pass)
    end

    def self.nextcloud(portal, login, pass)
      click text: IndexUI::NEXTCLOUD, pause: 6
      Login.login_cloud(portal, login, pass)
    end

    def self.webdav(portal, login, pass)
      click text: IndexUI::WEBDAV, pause: 6
      Login.login_cloud(portal, login, pass)
    end

    def self.sharepoint(portal, login, pass)
      click text: IndexUI::WEBDAV, pause: 6
      Login.login_cloud(portal, login, pass)
    end

    def self.put_back
      sleep 7
      hardback if (elements id: ID::CONNECT_SAVE).empty?
    end
  end
end
