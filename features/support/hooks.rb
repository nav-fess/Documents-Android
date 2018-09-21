require_relative'../support/login_support.rb'

Before do

  @driver.start_driver
  flc = FileLoginConfig.instance
  #pathFileDataPotrals = File.expand_path("../Documents-Android/features/login_tests/PortalTypeData.yml")
  pathFileDataPotrals = File.absolute_path("PortalTypeData.yml", "../Documents-Android/features/login_tests/")
  file.write("PATH = #{pathFileDataPotrals}")

end

After do
  @driver.driver_quit
end