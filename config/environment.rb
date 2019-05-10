require 'bundler'
Bundler.require

module Concerns
  module ClassMethods
    def destroy_all
      self.all.clear
    end
    def create(name)
      object = self.new(name)
      object.save
      object
    end
  end
  module InstanceMethods
    def save
      self.class.all << self
    end
  end
  module Findable
    def find_by_name(name)
      self.all.detect{|obj| obj.name == name}
    end
    def find_or_create_by_name(name)
      if !(find_by_name(name)==nil)
        find_by_name(name)
      else
        self.create(name)
      end
    end
  end
end

require_all 'lib'
