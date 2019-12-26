# frozen_string_literal: true

# Module contain different methods for adding storages
module AddStorage
  # Class contain methods for adding storage OneDrive
  class OneDrive < FrameBaseStorage
    def initialize(login, pass)
      tap_on_storage
      fill_email(login)
      tap_button_next_one
      fill_pass(pass)
      tap_button_next_two
      put_back
      tap_on_button_save
    end

    def self.tap_on_onedrive_storage
      click text: IndexUI::ONEDRIVE_STORAGE, pause: 6
    end

    def self.fill_email(email)
      fill_form textfield: IndexUI::ONEDRIVE_LOGIN, data: email, pause: 3
    end

    def self.tap_button_next_one
      click button: IndexUI::ONEDRIVE_NEXT_ONE
    end

    def self.fill_pass(pass)
      fill_form textfield: IndexUI::ONEDRIVE_PASS, data: pass, pause: 3
    end

    def self.tap_button_next_two
      click button: IndexUI::ONEDRIVE_NEXT_TWO, pause: 3
    end
  end
end
