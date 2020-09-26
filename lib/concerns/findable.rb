module Concerns

module Findable

    def find_by_name(name)
        
        self.all.find{|a| a.name == name}
      end
    end
  end