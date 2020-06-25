module Persistable
    module ClassMethods
        def self.extended(base)
            base.class_variable_set(:@@all, []) #how a module creates a class variable
        end

        def destroy_all
            self.clear 
        end
    end
end
