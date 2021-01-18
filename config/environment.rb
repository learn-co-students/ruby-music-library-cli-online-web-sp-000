require 'bundler'
Bundler.require

module Concerns
  
  module Findable
    def find_by_name(name)
      self.all.find {|o| o.name == name}
    end 
    
    def create_by_name(name)
      self.new.tap {|x| o.name = name}
    end 
    
    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
  end 
  
end 
  


require_all 'lib'
require_all 'config'






  
