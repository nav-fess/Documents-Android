require 'singleton'

class FileLoginConfig

  include Singleton
  attr_accessor :dataPortalsArray

  def initializeHashDataPortal(path)

    #file = File.open("/home/nav/RubymineProjects/cucumber/features/login_tests/file.txt","w")
    #file.write("initializeHashDataPortal")


    @dataPortalsArray=[]
    File.foreach(path) do |line|
      dataPortal = line.split('|')
      domenPortal = dataPortal[0].split('.')
      @dataPortalsArray.push({"domen" => domenPortal.last, "portal" => dataPortal[0], "l" => dataPortal[1], "p" => dataPortal[2]})
    end
    temp = @dataPortalsArray[0]["domen"]
    # file.write(temp)
    return @dataPortalsArray
  end

end