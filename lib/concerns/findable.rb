module Concerns
    module Findable

        def find_by_name(name)
            all.find { |obj| obj.name  == name }
        end

        def find_or_create_by_name(name)
            found = find_by_name(name)
            if(found != nil)
                return found
            else
                create(name)
            end
        end
    end
end