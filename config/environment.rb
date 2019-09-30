require 'bundler'
Bundler.require

module Concerns
    module Findable ##Findable class methods
      def find_by_name(name)
        all.find{|object| object.name == name}
      end
      
      def find_or_create_by_name(name)
        if all.include?(find_by_name(name))
          find_by_name(name)
        else
          create(name)
        end
      end
  end
end

require_all 'lib2'
