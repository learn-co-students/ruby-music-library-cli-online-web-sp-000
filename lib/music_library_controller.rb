class MusicLibraryController 
  attr_accessor :path 
  
  def initialize(path = "./db/mp3s")
    
    MusicImporter.new(path).import  
      
  
    
  end 
  
  def call 
    puts "Welcome to your music library!"
    user_input = gets
    while user_input != exit 
      user_input = gets 
    end 
      
     
    
  end
  
  
  
  
  
end 
