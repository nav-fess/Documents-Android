require 'appium_lib'

def appium_capabilities
  appium_config = File.join(File.dirname(__FILE__), 'config', 'appium.txt')
  capabilities = Appium.load_settings file: appium_config
  capabilities[:caps][:app] = File.join(File.dirname(__FILE__), 'spec', 'Documents.apk')
  capabilities.to_hash
end

