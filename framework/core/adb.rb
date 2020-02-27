# frozen_string_literal: true

# Class for extending adb functional
class ADB
  # @return [Array] list of connected devices udids
  def self.devices
    split_n = `adb devices`.split("\n")
    split_n[1, split_n.count].map { |line| line.split("\t")[0] }
  end
end
