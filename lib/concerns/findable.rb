
module Concerns::Findable 
    def self.find_by_name(name)
      self.all.detect{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
      #  returns (does not recreate) an existing song with the provided name if one exists in @@all
       if find_by_name(name) == nil
         create(name)
       else
         find_by_name(name)
       end
    end


end
