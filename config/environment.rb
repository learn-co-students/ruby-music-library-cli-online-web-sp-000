require 'pry'
require 'bundler'
Bundler.require

module Concerns
  module Findable
      def find_by_name(name)

        objects = []
        self.all.each do |obj|
          objects << obj
        end
        objects.detect{|a| a.name == name}
      end

      def find_or_create_by_name(name)

        if self.find_by_name(name) == nil
          obj = self.create(name)
        else
          obj = self.find_by_name(name)
        end
        obj
      end
  end
end


require_all 'lib'
