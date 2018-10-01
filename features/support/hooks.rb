require_relative '../support/login_support.rb' # ../support/login_support.rb'

Before do
  @driver.start_driver
  path_file_data_potrals = "#{Dir.pwd}/PortalTypeData.yml"
  $file_login_config = FileLoginConfig
                       .initialize_hash_data_portal(path_file_data_potrals)
end

After do
  @driver.driver_quit
end
