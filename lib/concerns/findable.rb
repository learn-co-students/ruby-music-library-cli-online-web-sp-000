require 'pry'

module Concerns::Findable 
  
  def find_by_name(name) 
    self.all.detect {|artist| artist.name === name}
  end
    
  
  def find_or_create_by_name(name)
    result = find_by_name(name)
    if result != nil
      return result
    else 
      result = self.create(name)
    end
    result
  end 
  
end 
