class MusicImporter
  attr_accessor :path

  @@path_directory = []

  def initialize(path)
    @path = path
  end

  def files
    @@path_directory << path 
  end
end
