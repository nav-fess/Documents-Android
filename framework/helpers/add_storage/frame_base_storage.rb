# frozen_string_literal: true

# Module contain different methods for adding storages
module AddStorage
  # Class contain methods for adding storage with frame
  class FrameBaseStorage
    def self.create(email, pass); end

    def self.click_on_storage; end

    def self.fill_email(email); end

    def self.fill_pass(pass); end

    def self.click_on_button_save
      click id: ID::CONNECT_SAVE, pause: 4
    end

    def self.put_back
      sleep 7
      hardback if (elements id: ID::CONNECT_SAVE).empty?
    end
  end
end
