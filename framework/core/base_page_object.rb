# frozen_string_literal: true

require_relative 'appium_driver'
require_relative 'page_object'

# Base class for page objects
class BasePageObject
  include PageObject
  extend AppiumDriver
end
