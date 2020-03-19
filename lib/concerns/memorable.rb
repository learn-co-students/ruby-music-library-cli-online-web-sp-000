module Memorable
  module ClassMethods
    def reset_all
      self.all.clear
    end
    
    def destroy_all
      self.all.clear
    end
    
    def all
      self.all
    end
  end
  
  module InstanceMethods
    def initialize(name)
      self.class.all << self
    end
    
    def save 
      @@all << self
    end
  end
end


 

