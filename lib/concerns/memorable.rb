require "pry"

module Concerns::Memorable

  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def all_sorted
      self.all.sort{|s1,s2| s1.name <=> s2.name}
    end

    def create(name)
      s = self.new(name)
      s.save
      s
    end
  end

  module InstanceMethods
      def initialize(name, artist = nil, genre = nil, filename = nil)
        @name = name
      end

      def save
        self.class.all << self
      end
  end
end
