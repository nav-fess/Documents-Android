require_relative'../support/login_support.rb'

Before do
  @driver.start_driver
  flc = FileLoginConfig.instance
  pathFileDataPotrals = "/home/nav/RubymineProjects/cucumber/PortalTypeData.yml"

  $fileLoginConfig = flc.initializeHashDataPortal(pathFileDataPotrals)

end

After do
  @driver.driver_quit
end