require 'singleton'

class FileLoginConfig
  include Singleton
  attr_accessor :dataPortalsArray

  def self.initializeHashDataPortal(path)

    @dataPortalsArray = []
    File.foreach(path) do |line|
      dataPortal = line.split('|')
      domenPortal = ''
      domenPortal = if dataPortal[0].include? 'personal'
                      dataPortal[0]
                    else
                      dataPortal[0].split('.').last
                    end

      @dataPortalsArray.push('domen' => domenPortal, 'portal' => dataPortal[0], 'l' => dataPortal[1], 'p' => dataPortal[2])
    end
    @dataPortalsArray
  end
end
