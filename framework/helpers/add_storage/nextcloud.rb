# frozen_string_literal: true

# Module contain different methods for adding storages
module AddStorage
  # Class contain methods for adding storage NextCloud
  class NextCloud < OtherBaseStorage
    def self.click_on_storage
      click text: IndexUI::NEXTCLOUD, pause: 6
    end
  end
end
