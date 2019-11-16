require 'pry'
require 'bundler'
Bundler.require

module Concerns
  module Findable
    module ClassMethods
      def find_by_name(name)
        objects = []
        ObjectSpace.each_object(self){|obj| objects << obj}
        objects.reverse.detect{|a| a.name == name}
      end

      def find_or_create_by_name(name)

        object_found = self.find_by_name(name)

        if object_found == nil
          new_object = self.create(name)
          new_object
        else
          object_found
        end
      end

    end
  end
end

require_all 'lib'

class Song
  extend Concerns::Findable::ClassMethods
end

class Artist
  extend Concerns::Findable::ClassMethods
end

class Genre
  extend Concerns::Findable::ClassMethods
end
