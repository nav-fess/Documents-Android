# Parse data potrals
class FileLoginConfig
  attr_accessor :data

  def self.data_portals
    @data = YAML.load_file("#{Dir.pwd}/features/registration_tests/PortalTypeData.json")
  end

  def self.data_portal(key)
    dataportrals = @data[key].split('|')
    { 'portal' => dataportrals[0], 'l' => dataportrals[1], 'p' => dataportrals[2] }
  end

  def self.data_regestration_portal(key)
  #  file = File.open("/home/vvoronin/RubymineProjects/Documents-Android/features/support/file.txt","w")
  #  file.write("@data_regestration = #{@data_regestration[key]}")
    dataportrals = @data[key].to_s.split('|')
    { 'portal' => dataportrals[0], 'email' => dataportrals[1], 'first_name' => dataportrals[2],'last_name'=> dataportrals[3], 'p'=> dataportrals[4], 'local' => dataportrals[5] }
  end

end
