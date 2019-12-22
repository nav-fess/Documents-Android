# frozen_string_literal: true

# Module contain different methods for adding storages
module AddStorage
  # Class contain methods for adding storage Box
  class Box < FrameBaseStorage
    def initialize(login, pass)
      click_on_storage
      fill_email(login)
      click_button_next_one
      fill_pass(pass)
      click_authorize
      click_access
      put_back
      click_on_button_save
    end

    def self.click_on_storage
      click text: IndexUI::BOX_STORAGE, pause: 6
    end

    def self.fill_email(email)
      fill_form textfield: IndexUI::BOX_EMAIL, data: email, pause: 3
    end

    def self.fill_pass(pass)
      fill_form textfield: IndexUI::GOOGLE_PASS_STORAGE, data: pass, pause: 3
    end

    def self.click_authorize
      click button: IndexUI::BOX_AUTHORIZE, pause: 2
    end

    def self.click_access
      click button: IndexUI::BOX_ACCESS, pause: 2
    end

    def self.click_next_two
      click button: IndexUI::GOOGLE_NEXT_TWO, pause: 2
    end
  end
end
