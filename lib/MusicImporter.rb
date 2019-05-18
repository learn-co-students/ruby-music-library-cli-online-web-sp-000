class MusicImporter
  extend Concerns::Findable 
  
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

  
end 