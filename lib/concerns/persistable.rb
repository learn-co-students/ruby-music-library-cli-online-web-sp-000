class Persistable
    module InstanceMethods
        def save
            self.class.all << self
        end
    end

    module ClassMethods
        def reset_all
            self.clear
        end
    end
end