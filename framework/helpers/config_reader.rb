# frozen_string_literal: true

require 'json'
require 'yaml'

# Class contains methods for getting private data
class ConfigReader
  PRIVATE_DATA_PATH = File.join __dir__, '..', '..', 'data'
  CONFIG_PATH = File.join __dir__, '..', '..', 'config'

  # Method for loading config data to ENV
  # @return [Array<String>]
  def self.load
    [CONFIG_PATH, PRIVATE_DATA_PATH].each do |path|
      Dir.entries(path) do |name|
        file_path = File.join path, name
        next if !File.file?(path) || name == 'appium.txt'

        config = JSON.parse File.read(file_path)
        ENV[name.split('.').first] = config.to_yaml
      end
    end
  end

  # Method for loading Appium capabilities
  # @return [Hash]
  def self.load_capabilities
    Appium.load_settings file: File.join(CONFIG_PATH, 'appium.txt')
  end

  # Method for solving security problem when using eval(ENV['some_value'])
  # @param [String] name
  # @return [Hash]
  def self.get(name)
    JSON.parse YAML.safe_load(ENV[name]).to_json, symbolize_names: true
  end

  # Method for finding config by role
  # @param [String] config_name
  # @param [String] role
  # @return [Hash]
  def self.find_config_by_role(config_name, role)
    get(config_name)[:accounts].each do |config|
      return config if config[:role] == role
    end
  end

  # Method for finding config by udid
  # @param [String] config_name
  # @param [String] udid
  # @return [Hash]
  def self.find_config_by_udid(config_name, udid)
    get(config_name)[:accounts].each do |config|
      return config if config[:udid] == udid
    end
  end
end
