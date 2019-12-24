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

  def self.screen(folder, screen_name)
    name_folder = File.join(File.dirname(__FILE__), '..', '..', folder)
    Dir.mkdir name_folder unless Dir.exist? name_folder
    sleep 4
    path_screenshots = File.join(name_folder, "#{screen_name}.png")
    puts "NAME SCREENSHOTS = #{path_screenshots}"
    screenshot(path_screenshots)
  end
end
