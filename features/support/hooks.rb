require_relative '../support/login_support.rb'

Before do
  @driver.start_driver
  FileLoginConfig.data_portals
end

After do
  @driver.driver_quit
end