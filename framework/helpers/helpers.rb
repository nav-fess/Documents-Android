# frozen_string_literal: true

require_relative '../../spec/spec_helper.rb'

# Class for wrapper appium
class Helpers
  DEFAULT_PAUSE = 0

  def self.capabilities_set(capabilities)
    capabilities.each do |key, value|
      caps[key] = value
    end
    restart
  end

  def self.screen(args = {})
    folder_name = File.join(File.dirname(__FILE__), '..', '..', 'screenshots',
                            "#{args[:folder]}_#{args[:timestamp]}")
    Dir.mkdir folder_name unless Dir.exist? folder_name
    sleep args[:pause] || DEFAULT_PAUSE
    path_screenshots = File.join(folder_name, "#{args[:screen_name]}  #{Time.now}.png")
    screenshot(path_screenshots)
  end
end
