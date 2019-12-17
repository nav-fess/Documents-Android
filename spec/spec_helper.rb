# frozen_string_literal: true

require 'appium_lib'
require 'json'

# Constants
require_relative '../framework/constants/id'
require_relative '../framework/constants/const_index'
require_relative '../framework/constants/xpath'

# Helpers
require_relative '../framework/helpers/add_storage_helper.rb'
require_relative '../framework/helpers/login_helpers.rb'
require_relative '../framework/helpers/registration_helper.rb'
require_relative '../framework/helpers/helpers.rb'
require_relative '../framework/helpers/plus_fab'
require_relative '../framework/helpers/open_section'
require_relative '../framework/helpers/share'

# Tools
require_relative '../framework/tools/appium_extension'
require_relative '../framework/tools/auth_data_tools'

include AppiumExtension
include Helpers

RSpec.configure do |config|
  config.filter_run_including foo: :bar
  config.silence_filter_announcements = true

  appium_config = File.join File.dirname(__FILE__), '..', 'config', 'appium.txt'
  capabilities = Appium.load_settings file: appium_config
  capabilities[:caps][:app] = File.join(File.dirname(__FILE__), '..', 'apk', 'Documents.apk')

  Selenium::WebDriver.logger.level = :error

  config.before(:all) do
    Appium::Driver.new(capabilities, true)
    Appium.promote_appium_methods Object
    @driver.start_driver
  end

  config.after(:all) do
    @driver.driver_quit
  end
end
