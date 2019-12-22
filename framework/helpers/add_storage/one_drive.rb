# frozen_string_literal: true

# Module contain different methods for adding storages
module AddStorage
  # Class contain methods for adding storage OneDrive
  class OneDrive < FrameBaseStorage
    def initialize(login, pass)
      click_on_onedrive_storage
      fill_form_google_email(login)
      click_button_next_one
      fill_pass_onedrive(pass)
      click_button_next_two
      put_back
      click_on_button_save
    end

    def self.click_on_onedrive_storage
      click text: IndexUI::ONEDRIVE_STORAGE, pause: 6
    end

    def self.fill_form_google_email(login)
      fill_form textfield: IndexUI::ONEDRIVE_LOGIN, data: login, pause: 3
    end

    def self.click_button_next_one
      click button: IndexUI::ONEDRIVE_NEXT_ONE
    end

    def self.fill_pass_onedrive(pass)
      fill_form textfield: IndexUI::ONEDRIVE_PASS, data: pass, pause: 3
    end

    def self.click_button_next_two
      click button: IndexUI::ONEDRIVE_NEXT_TWO, pause: 3
    end
  end
end
