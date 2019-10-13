require 'appium_lib'
require 'json'

RSpec.configure do |config|
  appium_config = File.join File.dirname(__FILE__), '..', 'config', 'appium.txt'
  capabilities = Appium.load_settings file: appium_config
  capabilities[:caps][:app] = File.join(File.dirname(__FILE__), 'Documents.apk')

  def data_portals
    JSON.parse(File.read("#{Dir.pwd}/PortalTypeData.json"))
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
