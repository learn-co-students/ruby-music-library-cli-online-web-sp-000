require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(name)
      new_object = self.all.find {|object| object.name === name}
      return new_object
    end
    def find_or_create_by_name(name)
      new_object = self.find_by_name(name)
      if (new_object != nil)
        return new_object
      else
        new_object = self.create(name)
        return new_object
      end
    end
  end
end

require_all 'lib'
