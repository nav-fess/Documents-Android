# frozen_string_literal: true

require 'appium_lib'
require 'json'

RSpec.configure do |config|
  config.filter_run_including foo: :bar
  config.silence_filter_announcements = true
  appium_config = File.join File.dirname(__FILE__), '..', 'config', 'appium.txt'
  capabilities = Appium.load_settings file: appium_config
  capabilities[:caps][:app] = File.join(File.dirname(__FILE__), 'Documents.apk')

  def registration_data
    Dir.chdir('../data/')
    JSON.parse(File.read("#{Dir.pwd}/PortalRegistrationData.json"))
  end

  def login_data_portals
    Dir.chdir('../data/')
    JSON.parse(File.read("#{Dir.pwd}/PortalLoginData.json"))
  end

  def login_data_personal
    Dir.chdir('../data/')
    JSON.parse(File.read("#{Dir.pwd}/PersonalLoginData.json"))
  end

  def login_data_clouds
    Dir.chdir('../data/')
    JSON.parse(File.read("#{Dir.pwd}/CloudLoginData.json"))
  end

  def add_data_storage
    Dir.chdir('../data/')
    JSON.parse(File.read("#{Dir.pwd}/StorageAddData.json"))
  end

  config.before(:all) do
    Appium::Driver.new(capabilities, true)
    Appium.promote_appium_methods Object
    @driver.start_driver
  end

  config.after(:all) do
    @driver.driver_quit
  end
end
