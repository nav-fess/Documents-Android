require_relative '../support/login_support.rb' #../support/login_support.rb'

Before do
  @driver.start_driver
  pathFileDataPotrals = "#{Dir.pwd}/PortalTypeData.yml"
  $fileLoginConfig = FileLoginConfig.initializeHashDataPortal(pathFileDataPotrals)
end

After do
  @driver.driver_quit
end