require_relative '../support/login_support.rb'

Before do
  #@driver.start_driver
  @AppiumDriver.start_driver
  FileLoginConfig.data_portals
end

After do
  @AppiumDriver.driver_quit
end