# frozen_string_literal: true

module FileManager
  # Class for performing operations with folders
  class Folder < Entity
    def create
      Navigation.go to: @path[:string]
      Create.folder @name

      @root_element = Search.find_folder_on_page @name
    end

    def init
      Navigation.go to: @path[:string]
      @root_element = Search.find_folder_on_page @name
    end

    def rename(name)
      open_context unless @context
      click id: ID::CONTEXT_RENAME
      fill_form id: ID::DIALOG_FIELD, data: name
      click id: ID::DIALOG_ACCEPT
      @name = name
      @path[:name] = name
      @context = false

      @root_element = Search.find_folder_on_page @name
    end

    def share
      # TODO
    end

    def copy
      # TODO
    end

    def move
      # TODO
    end

    def delete
      open_context unless @context
      click id: ID::CONTEXT_DELETE
      click id: ID::DIALOG_ACCEPT
      @context = false
      @root_element = nil
    end

    def info
      open_context unless @context
      info = element(id: ID::CONTEXT_INFO).text
      close_context if @context
      info
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
  end
end