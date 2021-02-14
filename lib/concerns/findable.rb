module Concerns::Findable
  
  def find_by_name(name)
  self.all.find {|instance| name == instance.name}
  end 
  
  def find_or_create_by_name(name)
    found_name = self.find_by_name(name)
      if found_name
        return found_name
    else
    self.create(name)
    end
  end
  
  
  
end 