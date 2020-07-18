# frozen_string_literal: true

require 'json'
require 'yaml'

# Class contains methods for getting private data
class ConfigHelper
  PRIVATE_DATA_PATH = File.join __dir__, '..', '..', 'data'
  CONFIG_PATH = File.join __dir__, '..', '..', 'config',
                          'test_devices_config.json'
  APPIUM_CONFIG_PATH = File.join __dir__, '..', '..', 'config', 'appium.txt'

  # Method for loading data to ENV
  # @return [Array<String>]
  def self.load
    load_config
    load_private_data
  end

  # Method for loading config data to ENV
  # @return [Array<String>]
  def self.load_config
    parsed_config = JSON.parse File.read CONFIG_PATH
    name = CONFIG_PATH.split('/').last
    ENV[name.split('.').first] = parsed_config.to_yaml
  end

  # Method for loading private data to ENV
  # @return [Array<String>]
  def self.load_private_data
    Dir.entries(PRIVATE_DATA_PATH).each do |name|
      file_path = File.join PRIVATE_DATA_PATH, name
      next unless File.file?(file_path)

      parsed_data = JSON.parse File.read(file_path)
      ENV[name.split('.').first] = parsed_data.to_yaml
    end
  end

  # Method for loading Appium capabilities
  # @return [Hash]
  def self.load_capabilities
    Appium.load_settings file: APPIUM_CONFIG_PATH
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
    get(config_name)[:devices].each do |config|
      return config if config[:udid] == udid
    end
  end
end
