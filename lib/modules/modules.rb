module Modules
  module ClassMethods
    def destroy_all
      all.clear
    end
    
    def create(name)
      self.new(name)
    end
      
    def find_by_name(name)
      self.all.find{|i| i.name == name}
    end
    
    def find_or_create_by_name(name)
      obj = find_by_name(name)
      self.new(name) if !!obj
    end
  end
  
  module InstanceMethods
    def initialize
      self.class.all << self
    end
    
    def save
      self.class.all << self
    end
  end
end