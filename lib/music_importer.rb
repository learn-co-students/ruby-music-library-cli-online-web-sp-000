class MusicImporter
  
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir["#{self.path}/*.mp3"].collect do |item|
      item.split("/").last
    end
  end
  
  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
  
end