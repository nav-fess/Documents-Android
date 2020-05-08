# frozen_string_literal: true

# Class for extending adb functional
class ADB
  def initialize(adb_path = File.join(ENV['ANDROID_HOME'], 'platform-tools', 'adb'))
    @path = adb_path
  end

  # Method for emulators
  # # @return [Array] list of connected devices udids
  def devices
    ADB.parse_devices `#{@path} devices`
  end

  # Method for real devices
  # @return [Array] list of connected devices udids
  def self.devices
    ADB.parse_devices `adb devices`
  end

  # Method for parsing adb string
  def self.parse_devices(string)
    string.split("\n")[1..-1].map do |line|
      line.split("\t").first
    end
  end
end
