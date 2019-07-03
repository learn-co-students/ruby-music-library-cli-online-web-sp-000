module Concerns

  module Findable
    
    def find_by_name(name)
      object = nil
      self.all.each do |element|
        if element.name == name
          object = element
        end
      end
      object
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name) == nil
        self.create(name)
      else
        self.find_by_name(name)
      end
    end

  end
end
