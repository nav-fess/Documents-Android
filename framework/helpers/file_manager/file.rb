# frozen_string_literal: true

require_relative 'entity'

module FileManager
  # Class for performing operations with files
  class File < Entity
    def create
      Navigation.go to: @path[:string]
      @extension = Tools.extension @name
      type = Tools.extension_to_type @extension
      file_name = @name.split('.')[0]
      case type
      when :document then Create.document file_name
      when :spreadsheet then Create.spreadsheet file_name
      when :presentation then Create.presentation file_name
      when :folder then raise 'Use Folder class for creating Folder!'
      end

      close_editor
      @root_element = Search.find_file_on_page @name
    end

    def init
      Navigation.go to: @path[:string]
      @extension = Tools.extension @name
      @root_element = Search.find_file_on_page @name
    end

    def rename(name)
      open_context unless @context
      click id: ID::CONTEXT_RENAME
      fill_form id: ID::DIALOG_FIELD, data: name
      click id: ID::DIALOG_ACCEPT
      @name = "#{name}.#{@extension}"
      @path[:name] = name
      @context = false

      @root_element = Search.find_file_on_page @name
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
      file_info = element(id: ID::CONTEXT_INFO).text
      close_context if @context
      file_info
    end

    def open_context
      @root_element = Search.find_file_on_page @name
      find_inside(element: @root_element, id: ID::FILE_CONTEXT).click
      @context = true
    end

    def close_context
      hardback
      @context = false
    end

    def external_link
      open_context unless @context
      click id: ID::CONTEXT_EXTERNAL_LINK
      close_context if @context
    end

    def download
      open_context unless @context
      click id: ID::CONTEXT_DOWNLOAD
    end

    def edit
      open_context unless @context
      click id: ID::CONTEXT_EDIT
    end

    def close_editor
      hardback pause: 2
    end
  end
end