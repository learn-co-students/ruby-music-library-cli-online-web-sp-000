require "pry"

module Concerns

module Findable

    def find_by_name(name) 
      #binding.pry      
        self.all.detect{|a| a.name == name}
      end
    
    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
      #binding.pry
      end
    end
  end


  require_all 'lib'