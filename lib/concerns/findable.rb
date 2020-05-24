   module Concerns::Findable
        def find_by_name(name)
            self.all.detect {|i| i.name == name}
        end

        def find_or_create_by_name(name)
            a = self.find_by_name(name)
            if !a    
            self.create(name)
            else
                a    
            end
        end
    end

    class Artist
        extend Concerns::Findable
    end

    class Song
        extend Concerns::Findable
    end

    class Genre
        extend Concerns::Findable
    end