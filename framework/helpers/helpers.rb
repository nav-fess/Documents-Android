# frozen_string_literal: true

require_relative '../../framework/constants/id.rb'
require_relative '../../framework/constants/const_index.rb'
require_relative '../../framework/tools/appium_extension.rb'
require_relative '../../spec/spec_helper.rb'
include AppiumExtension

# Module contain different classes of help
module Helpers
  def capabilities_set(capabilities)
    capabilities.each do |key, value|
      caps[key] = value
    end
    restart
  end
end
