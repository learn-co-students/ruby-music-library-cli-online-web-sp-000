require 'pry'


class MusicImporter
  
  attr_accessor :path 
  
  def initialize(path)
    @path = path
  end 
  
  def files
    test_ = Dir["./spec/fixtures/mp3s/*"]
    
    collection = []
    
    test_.each do |song|
      song.slice!("./spec/fixtures/mp3s/")
      collection << song
    end
     
  end
    
 def import
   
    array = self.files 
    
    array.collect do |s|
    Song.create_from_filename(s)
    end
    
  end
      
    
  
  
  
  
  
end