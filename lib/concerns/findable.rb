module Concerns::Findable
    module ClassMethods
        
        def find_by_name(myname)
            self.all.detect{ |s| s.name == myname }
        end
        
        def find_or_create_by_name(myname)
            if find_by_name(myname) !=nil
                find_by_name(myname)
            else
                create(myname)
            end
        end
        
    end
end
