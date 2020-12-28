module Concerns::Memorable
  module ClassMethods
    def destroy_all
      self.all.clear
    end
 
    def count
      self.all.count
    end
    
    def sort_by_name
      self.all.sort{|a,b|a.name<=>b.name}
    end
    
  end

 
  module InstanceMethods
    def initialize(name)
      
      self.name = name
      
    end
    
    def save
      self.class.all << self
    end
    
    
    
  end
end