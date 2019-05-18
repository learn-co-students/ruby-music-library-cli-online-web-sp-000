class MusicLibraryController 
  
  def initialize(path = "./db/mp3s")
   @path = path 
   new_object = self.new(path) 
  end 
end 