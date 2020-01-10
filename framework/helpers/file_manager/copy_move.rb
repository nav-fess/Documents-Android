# frozen_string_literal: true

module FileManager
  # Class for navigating during copy or move operations
  class CopyMove
    def self.make(path:, duplicate: 'copy')
      duplicate_id = duplicate_mode_to_id duplicate
      Navigation.operations_frame_go to: path
      click id: ID::OPERATIONS_CONFIRM
      sleep 2

      return unless elements(id: duplicate_id).count.positive?

      click id: duplicate_id
      click id: ID::OPERATIONS_DUPLICATE_CONFIRM
    end

    def self.duplicate_mode_to_id(mode)
      return ID::OPERATIONS_DUPLICATE_COPY if mode == 'copy'
      return ID::OPERATIONS_DUPLICATE_OVERWRITE if mode == 'overwrite'
      return ID::OPERATIONS_DUPLICATE_SKIP if mode == 'skip'
    end
  end
end
