require 'singleton'
# Parse data potrals
class FileLoginConfig
  include Singleton
  attr_accessor :dataPortalsArray

  def self.initialize_hash_data_portal(path)
    @data_portals_array = []
    File.foreach(path) do |line|
      data_portal = line.split('|')
      domen_portal = (data_portal[0].include? 'personal') ? data_portal[0]
                     : data_portal[0].split('.').last
      @data_portals_array.push('domen' => domen_portal,
                               'portal' => data_portal[0], 'l' => data_portal[1],
                               'p' => data_portal[2])
    end
    @data_portals_array
  end
end
