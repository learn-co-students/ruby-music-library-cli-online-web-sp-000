module Concerns
  module Findable
    def find_by_name(name)
      found = nil
      self.all.each do |song|
        if song.name == name
          found = song
        else
        end
      end
      return found
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name) == nil
        create(name)
      else
        find_by_name(name)
      end
    end
  end
end
