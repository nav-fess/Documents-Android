# frozen_string_literal: true

module FileManager
  # Class for accessing the file creation
  class Create
    def self.document(name)
      PlusFAB.open if PlusFAB.displayed?
      PlusFAB.create name, :document
    end

    def self.spreadsheet(name)
      PlusFAB.open if PlusFAB.displayed?
      PlusFAB.create name, :spreadsheet
    end

    def self.presentation(name)
      PlusFAB.open if PlusFAB.displayed?
      PlusFAB.create name, :presentation
    end

    def self.folder(name)
      PlusFAB.open if PlusFAB.displayed?
      PlusFAB.create name, :folder
    end

    def self.picture
      Camera.open
      Camera.make_photo
    end

    def self.upload
      # TODO
    end

    def self.storage
      # TODO
    end
  end
end
