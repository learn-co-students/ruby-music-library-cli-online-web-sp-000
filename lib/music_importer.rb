class MusicImporter
  attr_accessor :path 
  
  def initialize(path)
    @path = path
  end 
  
  def files
    files = Dir.glob("#{path}/*.mp3").collect {|f| f.gsub("#{path}/", "")}
  end 
  def import 
    files.each do |f|
      Song.create_from_filename(f)
    end 
  end
end