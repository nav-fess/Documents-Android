# frozen_string_literal: true

module FileManager
  # Class for storing helper methods
  class Tools
    def self.path?(string)
      string.include? '/'
    end

    def self.extension(string)
      list = string.split('.')
      list.last if list.last != string
    end

    def self.extension_to_type(string)
      return :document if Consts::DOCUMENT_EXTENSIONS.include? string
      return :spreadsheet if Consts::SPREADSHEET_EXTENSIONS.include? string
      return :presentation if Consts::PRESENTATION_EXTENSIONS.include? string
      return :folder if string.nil?
    end

    def self.parse_path(string)
      list = string.split '/'
      { string: string, name: list.pop, section: list.shift, folders: list }
    end
  end
end