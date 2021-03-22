class MusicImporter
  attr_accessor :path 
  def initialize(path)
    @path = path 
  end 
   
  def files 
    @files = Dir.entries(@path)
    @files.delete_if{|files| files == "." || files == ".."}
  end 
  
  def import
    files.map {|file| Song.create_from_filename(file)}
  end  
end 