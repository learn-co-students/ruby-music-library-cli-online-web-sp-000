module Concerns::Findable 

        def find_by_name(name)
            self.all.detect{|f| f.name == name}
        end

        def create(name)
            i = self.new(name)
            i.save
            i
        end

        def find_or_create_by_name(name)
            if find_by_name(name) == nil
                create(name)
            else
                find_by_name(name)
            end
        end


end