module Concerns::Findable
  
  def find_by_name(name)
    self.all.detect do |obj| 
      obj.name == name 
    end 
  end 
  
  def find_or_create_by_name(name)
    if !find_by_name(name)
      self.create(name)
    else 
      find_by_name(name)
    end 
  end 
  
end 