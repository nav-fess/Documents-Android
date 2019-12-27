# frozen_string_literal: true

# Module contain different methods for adding storages
module AddStorage
  # Class contain methods for adding storage WebDAV
  class WebDAV < OtherBaseStorage
    def self.tap_on_storage
      click text: IndexUI::WEBDAV, pause: 6
    end
  end
end
