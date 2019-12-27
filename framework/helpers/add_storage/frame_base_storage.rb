# frozen_string_literal: true

# Module contain different methods for adding storages
module AddStorage
  # Class contain methods for adding storage with frame
  class FrameBaseStorage
    def self.create
      raise NotImplementedError
    end

    def self.tap_on_storage
      raise NotImplementedError
    end

    def self.fill_email
      raise NotImplementedError
    end

    def self.fill_pass
      raise NotImplementedError
    end

    def self.tap_on_button_save
      click id: ID::CONNECT_SAVE, pause: 4
    end

    def self.put_back
      sleep 7
      hardback if (elements id: ID::CONNECT_SAVE).empty?
    end
  end
end
