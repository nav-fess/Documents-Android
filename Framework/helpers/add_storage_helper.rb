# frozen_string_literal: true

require_relative '../../Framework/constants/id.rb'
require_relative '../../Framework/constants/const_index.rb'
require_relative '../../Framework/Tools/appium_extension.rb'

include AppiumExtension

# Module contain different classes of help
module Helpers
  class AddStorage
    def self.google_drive(login, pass)
      click text: ConstIndex::GOOGLE_STORAGE, pause: 3
      fill_form textfield: ConstIndex::GOOGLE_EMAIL,
                data: login

      click button: ConstIndex::GOOGLE_NEXT_ONE
      fill_form textfield: ConstIndex::GOOGLE_PASS_STORAGE,
                data: pass, pause: 3

      click button: ConstIndex::GOOGLE_NEXT_TWO
      click button: ConstIndex::GOOGLE_NEXT_THREE, pause: 4
      click id: ID::CONNECT_SAVE
      click button: ConstIndex::BACK, pause: 5
      element id: ID::ACCOUNTS, pause: 5
    end

    def self.one_drive(login, pass)
      click text: ConstIndex::ONEDRIVE_STORAGE
      fill_form textfield: ConstIndex::ONEDRIVE_LOGIN,
                data: login, pause: 3

      click button: ConstIndex::ONEDRIVE_NEXT_ONE
      fill_form textfield: ConstIndex::ONEDRIVE_PASS,
                data: pass, pause: 3

      click button: ConstIndex::ONEDRIVE_NEXT_TWO, pause: 5
      click id: ID::CONNECT_SAVE
      click button: ConstIndex::BACK, pause: 5
      element id: ID::ACCOUNTS, pause: 5
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
      sleep 10
      press_keycode 4
      click id: ID::CONNECT_SAVE, pause: 4
      click button: ConstIndex::BACK, pause: 5
      element id: ID::ACCOUNTS, pause: 5

    end
  end
end
