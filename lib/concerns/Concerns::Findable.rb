module Concerns::Findable
    
    def find_by_name(name)
        all.find do |object|
            object.name == name
        end
    end

    def find_or_create_by_name(name)
        if all.include?(find_by_name(name))
            return find_by_name(name)
        else
            new_object = create(name)
            return new_object
        end
    end

end