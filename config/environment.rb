require 'bundler'
require 'pry'
Bundler.require

module Concerns
  module Findable
    
    def create(name)
      i = self.new(name)
      i.save
      return i
    end
    
    def destroy_all
      self.all.clear
    end
    
    def find_by_name(name)
      self.all.detect{|x| x.name == name}
    end
    
    def find_or_create_by_name(name)
      if find_by_name(name) == nil
        create(name)
      else
        find_by_name(name)
      end
    end
    
    
  end
end

require_all 'lib'
