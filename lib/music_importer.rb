require 'pry'
 
class MusicImporter
 
  
  @@files = []
  def initialize(path)
    @path = path 
    @files = files 
  end 
  
  def path 
    @path 
  end 
  
  def files
   Dir.glob("#{path}/*").map do |file| file.gsub("#{path}/", '') 
    end
  end

  def import 
    files.each do |file|
      Song.create_from_filename(file)
    end 
  end 

end 
 
