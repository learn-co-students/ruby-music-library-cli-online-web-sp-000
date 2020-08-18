module Nameable
    module ClassMethods
        def create_by_name(name)
            #same as i = self.new; i.name = name; i
            self.new.tap do |o|
                o.name = name
            end
        end
    end
end
