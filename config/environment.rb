require 'bundler'
Bundler.require

module Concerns
    module Findable
        def find_by_name(name)
            self.all.detect{ |s| s.name == name}
        end

        def find_or_create_by_name(name)
            if find_by_name(name)
                return self.find_by_name(name)
            else
               self.create(name)
            end
        end
    end
end

require_all 'lib'
