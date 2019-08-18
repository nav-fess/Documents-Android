require 'appium_lib'

def caps
  { caps: {
    deviceName: 'Name',
    platformName: 'Android',
    app: File.join(File.dirname(__FILE__), 'onlyoffice-documents-2.2.0-debug_build-98_January.24_16-53.apk'),
    appPackage: 'com.onlyoffice.documents',
    appActivity: 'com.onlyoffice.documents.ui.activities.login.PortalsActivity',
    newCommandTimeout: '3600'
  } }
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object
