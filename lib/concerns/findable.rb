module Concerns
  module Findable
    def find_by_name(name)
      self.all.find do |song|
        song.name == name
      end
    end
    
    def find_or_create_by_name(name)
      if self.find_by_name(name)
        self.find_by_name(name)
      else
        self.create(name)
      end
    end
  end
  
  module Alphabetical
    def alphabetical
      self.all.sort_by{|song| song.name}
    end
  end
end