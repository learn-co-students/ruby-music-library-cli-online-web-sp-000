module Concerns
  module Findable
  
    def find_by_name(name)
    all.detect{|a| a.name == name}
    end
    
    def find_or_create_by_name(name)
      if new = find_by_name(name)
      new
      else
      new = self.create(name)
      end
    end
  
end
end