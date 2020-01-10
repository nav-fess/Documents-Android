# frozen_string_literal: true

module FileManager
  # Class for performing operations with folders
  class Folder < Entity
    def create
      Navigation.go to: @path[:string]
      Create.folder @name

      update_element_link
    end

    def init
      Navigation.go to: @path[:string]
      update_element_link
    end

    def rename(name)
      open_context unless @context
      click id: ID::CONTEXT_RENAME
      fill_form id: ID::DIALOG_FIELD, data: name
      click id: ID::DIALOG_ACCEPT
      @name = name
      @path[:name] = name
      @context = false

      update_element_link
    end

    def copy(to:)
      open_context unless @context
      click id: ID::CONTEXT_COPY
      CopyMove path: to
      @context = false

      update_element_link
    end

    def move(to:)
      open_context unless @context
      click id: ID::CONTEXT_MOVE
      CopyMove path: to
      @context = false

      @path = Tools.parse_path to
      @path[:name] = @name
      remove_element_link
    end

    def open_context
      @root_element = Search.find_folder_on_page @name
      find_inside(element: @root_element, id: ID::FOLDER_CONTEXT).click
      @context = true
    end

    def close_context
      hardback
      @context = false
    end

    def update_element_link
      @root_element = Search.find_folder_on_page @name
    end
  end
end
