require 'pry'

module Concerns::Findable 
  
  def find_by_name(name) 
   self.all.each do |artist|
     if artist.name == name
       return artist 
     end
   end
   false
 end
    
  
  def find_or_create_by_name(name)
    result = find_by_name(name)
    if result != false
      return result
    else 
      result = self.create(name)
    end
    result
  end 
  
end 
