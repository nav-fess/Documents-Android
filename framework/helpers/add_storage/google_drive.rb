# frozen_string_literal: true

require_relative 'frame_base_storage'

# Module contain different methods for adding storages
module AddStorage
  # Class contain methods for adding storage Google Drive
  class GoogleDrive < FrameBaseStorage
    def self.create(email, pass)
      tap_on_storage
      fill_email(email)
      tap_button_next_one
      fill_pass(pass)
      tap_next_two
      tap_next_three
      put_back
      tap_on_button_save
    end

    def self.tap_on_storage
      click text: IndexUI::GOOGLE_STORAGE, pause: 6
    end

    def self.fill_email(email)
      fill_form textfield: IndexUI::GOOGLE_EMAIL, data: email
    end

    def self.tap_button_next_one
      click button: IndexUI::GOOGLE_NEXT_ONE
    end

    def self.fill_pass(pass)
      fill_form textfield: IndexUI::GOOGLE_PASS_STORAGE, data: pass, pause: 3
    end

    def self.tap_next_two
      click button: IndexUI::GOOGLE_NEXT_TWO
    end

    def self.tap_next_three
      click button: IndexUI::GOOGLE_NEXT_THREE, pause: 4
    end
  end
end
