# frozen_string_literal: true

require_relative 'frame_base_storage'

# Module contain different methods for adding storages
module AddStorage
  # Class contain methods for adding storage Google Drive
  class GoogleDrive < FrameBaseStorage
    def self.create(email, pass)
      click_on_storage
      fill_email(email)
      click_button_next_one
      fill_pass(pass)
      click_next_two
      click_next_three
      put_back
      click_on_button_save
    end

    def self.click_on_storage
      click text: IndexUI::GOOGLE_STORAGE, pause: 6
    end

    def self.fill_email(email)
      fill_form textfield: IndexUI::GOOGLE_EMAIL, data: email
    end

    def self.click_button_next_one
      click button: IndexUI::GOOGLE_NEXT_ONE
    end

    def self.fill_pass(pass)
      fill_form textfield: IndexUI::GOOGLE_PASS_STORAGE, data: pass, pause: 3
    end

    def self.click_next_two
      click button: IndexUI::GOOGLE_NEXT_TWO
    end

    def self.click_next_three
      click button: IndexUI::GOOGLE_NEXT_THREE, pause: 4
    end
  end
end
