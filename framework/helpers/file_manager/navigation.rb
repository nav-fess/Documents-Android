# frozen_string_literal: true

module FileManager
  # Class for navigation management
  class Navigation
    MY_DOCUMENTS = ['my documents', 'mydocuments'].freeze
    SHARED_WITH_ME = ['shared with me', 'sharedwithme'].freeze
    COMMON_DOCUMENTS = ['common documents', 'commondocuments'].freeze
    PROJECT_DOCUMENTS = ['project documents', 'projectdocuments',\
                         'projects documents', 'projectsdocuments'].freeze
    TRASH = ['trash'].freeze

    def self.go(to:)
      path = Tools.parse_path to
      open_section path[:section]&.downcase
      path[:folders]&.each do |folder_name|
        Create.folder(folder_name) unless Search.folder_exist? folder_name
        sleep 3
        open_folder folder_name
      end
    end

    def self.open_section(section)
      OpenSection.sections_displayed? 10
      if MY_DOCUMENTS.include? section
        OpenSection.my_documents
      elsif SHARED_WITH_ME.include? section
        OpenSection.shared_with_me
      elsif COMMON_DOCUMENTS.include? section
        OpenSection.common_documents
      elsif TRASH.include? section
        OpenSection.trash
      end
    end

    def self.open_folder(folder)
      searched_folder = Search.find_folder_on_page(folder)
      searched_folder.click
    end

    def self.cloud_root
      click id: ID::CLOUDS
    end

    def self.recent_root
      click id: ID::RECENT
    end

    def self.on_device_root
      click id: ID::ON_DEVICE
    end

    def self.profile_root
      click id: ID::PROFILE
    end
  end
end
