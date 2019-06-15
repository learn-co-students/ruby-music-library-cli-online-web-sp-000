require 'bundler'
Bundler.require

module Concerns
  
  module Findable
    
    def find_by_name(name)
      self.all.detect do |item|
        item.name == name
      end
    end
    
    def find_or_create_by_name(name)
      item = self.find_by_name(name)
      if !item
        item = self.create(name)
      end
      item
    end
    
  end
  
end

require_all 'lib'
