# frozen_string_literal: true

module FileManager
  # Base FileManager class
  class Entity
    attr_reader :path, :name, :context, :root_element
    def initialize(path)
      @path = Tools.parse_path path
      @name = @path[:name]
      @context = false
      @root_element = nil
    end

    def create
      raise NotImplementedError
    end

    def rename
      raise NotImplementedError
    end

    def share
      # TODO
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

    def delete
      open_context unless @context
      click id: ID::CONTEXT_DELETE
      click id: ID::DIALOG_ACCEPT
      @context = false
      remove_element_link
    end

    def info
      open_context unless @context
      file_info = element(id: ID::CONTEXT_INFO).text
      close_context if @context
      file_info
    end

    def open_context
      raise NotImplementedError
    end

    def close_context
      raise NotImplementedError
    end

    def update_element_link
      raise NotImplementedError
    end

    def remove_element_link
      @root_element = nil
    end
  end
end
