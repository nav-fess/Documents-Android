require_relative'../support/login_support.rb'

Before do
  @driver.start_driver
  flc = FileLoginConfig.instance
  pathFileDataPotrals = "/home/vvoronin/RubymineProjects/Documents-Android/PortalTypeData.yml"

  $fileLoginConfig = flc.initializeHashDataPortal(pathFileDataPotrals)

end

After do
  @driver.driver_quit
end