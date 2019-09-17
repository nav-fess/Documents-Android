require 'yaml'
require 'appium_lib'
#require 'fabrication'
#require 'faker'

RSpec.configure do |config|

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:all) do

    desired_caps = {
       caps: {
          deviceName: 'Name',
          platformName: 'Android',
          app: File.join(File.dirname(__FILE__), 'onlyoffice-documents-3.0.0b-DEV-x86-release_build-150_August.23_10-56.apk'),
          appPackage: 'com.onlyoffice.documents.beta',
          appActivity: 'com.onlyoffice.documents.ui.activities.login.SplashActivity',
          newCommandTimeout: 3600,
          automationName: 'UiAutomator2'
      } }
    Appium::Driver.new(desired_caps, true)
    Appium.promote_appium_methods Object

    @driver.start_driver
    end

  config.after(:all) do
    @driver.driver_quit
  end
end

=begin
  config.around(:each) do |example|
    puts 'Starting driver...'
    start_driver
    puts 'Waiting for splash screen...'
    !wait_for(timeout: 15) { @driver.current_activity != @driver.caps[:appActivity] }
    example.run
    #take_screenshot(example.metadata) if example.exception
    #quit_driver

  end
=end
