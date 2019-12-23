# frozen_string_literal: true

require_relative '../../spec/spec_helper.rb'

# Class for wrapper appium
class Helpers
  def self.capabilities_set(capabilities)
    capabilities.each do |key, value|
      caps[key] = value
    end
    restart
  end
end
