module Concerns
  
  
  module Findable
    
    
    def create(object_name)
      object = self.new(object_name)
      object.save
      object
    end

     def find_by_name(object_name)
      self.all.find {|object| object.name == object_name }
    end

     def find_or_create_by_name(object_name)
      self.find_by_name(object_name) ? self.find_by_name(object_name) : self.create(object_name)
    end
    
    
    
    
    
  end
  
  
end