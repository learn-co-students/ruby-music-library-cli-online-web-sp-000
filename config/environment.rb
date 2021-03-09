require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(name)
      all.detect{|a| a.name == name}
    end
    
    def find_or_create_by_name(name)
    s = self.find_by_name(name)
    
    if s 
      return s
    else
      s = self.create(name)
      return s
    end
    
    def alphabetical
      
    end
  end
  
  def alphabetical
    self.all.sort_by do |a|
      a.name
    end
  end
    
  end
end

require_all 'lib'
