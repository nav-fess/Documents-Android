# Parse data potrals
class FileLoginConfig
  attr_accessor :data

  def self.data_portals
    @data = YAML.load_file("#{Dir.pwd}/PortalTypeData.json")
  end

  def self.data_portal(key)
    dataportrals = @data[key].split('|')
    { 'portal' => dataportrals[0], 'l' => dataportrals[1], 'p' => dataportrals[2] }
  end
end
