# frozen_string_literal: true

require 'appium_lib'
require 'json'

# Constants
require_relative '../framework/constants/consts'
require_relative '../framework/constants/id'
require_relative '../framework/constants/index_ui'
require_relative '../framework/constants/xpath'

# Helpers
require_relative '../framework/helpers/add_storage/add_storage'
require_relative '../framework/helpers/login'
require_relative '../framework/helpers/registration'
require_relative '../framework/helpers/helpers'
require_relative '../framework/helpers/plus_fab'
require_relative '../framework/helpers/open_section'

# Tools
require_relative '../framework/tools/appium_extension'
require_relative '../framework/tools/auth_data_tools'

include AppiumExtension

RSpec.configure do |config|
  config.filter_run_including foo: :bar
  config.silence_filter_announcements = true

  appium_config = File.join File.dirname(__FILE__), '..', 'config', 'appium.txt'
  capabilities = Appium.load_settings file: appium_config
  capabilities[:caps][:app] = File.join(File.dirname(__FILE__), '..', 'apk', 'Documents.apk')

  config.after(:each) do |example|
    if example.exception
      meta = example.metadata
      filename = File.basename(meta[:file_path])
      fail_spec_info = "#{meta[:line_number]}|#{meta[:full_description]}"
      screenshot_name = "#{Time.now.strftime '%Y-%m-%d-%H-%M-%S'}|#{filename}|#{fail_spec_info}.png"
      screenshot_path = "screenshots/errors/#{screenshot_name}"
      screenshot(screenshot_path)
    end
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
