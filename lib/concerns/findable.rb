require 'pry'
 


module Concerns
  
  
  
  module Findable 
  
  def find_by_name(name)
     self.all.detect do |o| 
       o.name == name 
     end 
  end 






  def find_by_name(name)
        
     self.all.detect do |song| 
       song.name == name 
     end 
  end 
  
  def create_by_name(song_name)
    self.create(song_name)
  end 

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)  
  end 




end 

end 