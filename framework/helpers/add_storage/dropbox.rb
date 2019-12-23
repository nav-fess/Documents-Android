# frozen_string_literal: true

# Module contain different methods for adding storages
module AddStorage
  # Class contain methods for adding storage Dropbox
  class Dropbox < FrameBaseStorage
    def initialize(login, pass)
      click_on_storage
      click_on_sign_in_with_google
      fill_email(login)
      click_button_next_one
      fill_pass(pass)
      click_next_two
      put_back
      click_on_button_save
    end

    def self.tap_on_storage
      click text: IndexUI::DROPBOX_STORAGE, pause: 6
    end

    def self.tap_on_sign_in_with_google
      click button: IndexUI::SIGNIN_WITH_GOOGLE, pause: 5
    end

    def self.tap_email(email)
      fill_form textfield: IndexUI::GOOGLE_EMAIL, data: email, pause: 3
    end

    def self.tap_button_next_one
      click button: IndexUI::GOOGLE_NEXT_ONE
    end

    def self.fill_pass(pass)
      fill_form textfield: IndexUI::GOOGLE_PASS_STORAGE, data: pass, pause: 3
    end

    def self.tap_next_two
      click button: IndexUI::GOOGLE_NEXT_TWO, pause: 2
    end
  end
end
