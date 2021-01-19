require 'bundler'
require 'pry'
Bundler.require

module Concerns
    module Findable

        def find_by_name(name)
            all.detect do |instance|
                if instance.name == name
                    self
                end
            end
        end

        def find_or_create_by_name(name)
            found = self.find_by_name(name)
            if !found
               created = self.create(name)
               created
            else
               found
            end
       end
    end
end

require_all 'lib'
