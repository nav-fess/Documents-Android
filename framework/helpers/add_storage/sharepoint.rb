# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

# Module contain different methods for adding storages
module AddStorage
  # Class contain methods for adding storage Sharepoint
  class Sharepoint < OtherBaseStorage
    def self.click_on_storage
      click text: IndexUI::WEBDAV, pause: 6
    end
  end
end
