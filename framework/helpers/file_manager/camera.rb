# frozen_string_literal: true

module FileManager
  # Class for working with the built-in camera
  class Camera
    def self.make_photo
      shoot
      save
    end

    def self.open
      click id: ID::MAKE_PHOTO
    end

    def self.shoot
      click xpath: Xpath::CAMERA_MAKE_PHOTO
    end

    def self.switch
      click xpath: Xpath::CAMERA_SWITCH
    end

    def self.save
      click id: ID::CAMERA_SAVE
    end

    def self.retry
      click id: ID::CAMERA_RETRY
    end
  end
end
