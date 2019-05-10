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
end

require_all 'lib'
