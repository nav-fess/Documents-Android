# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

# Module contain different methods for adding storages
module AddStorage
  # Class contain methods for adding storage YandexDisk
  class YandexDisk < OtherBaseStorage
    def self.create(email, pass)
      super('', email, pass)
    end

    def self.tap_on_storage
      click text: IndexUI::YANDEX_STORAGE, pause: 6
    end

    def self.fill_url(url)
      puts "Not have field for #{url}"
    end
  end
end
