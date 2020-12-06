module Concerns::Memorable 
  module ClassMethods
  
    def destroy_all 
      self.all.clear 
    end 
  
    def create(name)
      out = new(name)
      out.save 
      return out
    end
    
  end
  module InstanceMethods
     def save
      self.class.all.push(self)
    end
    
  end
end