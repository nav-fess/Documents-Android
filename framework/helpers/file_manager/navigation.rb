# frozen_string_literal: true

module FileManager
  # Class for navigation management
  class Navigation
    def self.go(to:)
      path = Tools.parse_path to
      open_section path[:section]
      path[:folders]&.each do |folder_name|
        Create.folder(folder_name) unless Search.folder_exist? folder_name
        sleep 3
        open_folder folder_name
      end
    end

    def self.open_section(section)
      OpenSection.sections_displayed? 10
      case section&.downcase
      when Consts::MyDocuments::TITLE.downcase then OpenSection.my_documents
      when Consts::SharedWithMe::TITLE.downcase then OpenSection.shared_with_me
      when Consts::CommonDocuments::TITLE.downcase then OpenSection.common_documents
      when Consts::ProjectDocuments::TITLE.downcase then OpenSection.project_documents
      when Consts::Trash::TITLE.downcase then OpenSection.trash
      else raise "Unknown section name: #{section}!"
      end
    end

    def self.operations_frame_open_section(section)
      case section
      when Consts::MyDocuments::TITLE then click id: ID::OPERATIONS_MY
      when Consts::SharedWithMe::TITLE then click id: ID::OPERATIONS_SHARED
      when Consts::CommonDocuments::TITLE then click id: ID::OPERATIONS_COMMON
      when Consts::ProjectDocuments::TITLE then click id: ID::OPERATIONS_PROJECTS
      else raise "Unknown section name: #{section}!"
      end
    end

    def self.open_folder(folder)
      searched_folder = Search.find_folder_on_page(folder)
      searched_folder.click
    end

    def self.operations_frame_go(to:)
      path = Tools.parse_path to
      operations_frame_open_section path[:section]
      path[:folders]&.each do |folder_name|
        sleep 3
        open_folder folder_name
      end
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
