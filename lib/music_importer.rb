class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    files = Dir.glob("#{path}/*.mp3")
    files.collect {|file| File.basename(file, ".*")}
  end
  
  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
end