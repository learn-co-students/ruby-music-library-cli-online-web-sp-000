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
    end
  end
end

class Song
  extend Concerns::Findable::ClassMethods
end

class Artist
  extend Concerns::Findable::ClassMethods
end

class Genre
  extend Concerns::Findable::ClassMethods
end

require_all 'lib'
