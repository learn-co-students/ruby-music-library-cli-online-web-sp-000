class MusicImporter
 
  extend Concerns::Findable 
 
  attr_accessor :file 
  
  @@all = []
  
  def initialize(path)
    @path = path   
  end 
  
  def path 
    @path 
  end 

  def files
     array = Dir.glob("#{path}/*.mp3").collect{|file| file.split(path+"/")[1]}
  end   

  def import
    files.each do |file|
    Song.create_from_filename(file)
    end 
  end 
  
end 