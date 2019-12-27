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
      raise NotImplementedError
    end

    def copy
      raise NotImplementedError
    end

    def move
      raise NotImplementedError
    end

    def delete
      raise NotImplementedError
    end

    def info
      raise NotImplementedError
    end

    def open_context
      raise NotImplementedError
    end

    def close_context
      raise NotImplementedError
    end
  end
end
