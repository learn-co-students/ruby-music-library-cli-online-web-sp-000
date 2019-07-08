# module Concerns::Findable
#   def find_by_name(name)
#     all.detect do |song|
#       song.name == name
#     end
#   end

#   def find_or_create_by_name(name)
#     song_exists = find_by_name(name)
#     song_exists ? song_exists : create(name)
#   end
# end


module Concerns
    module Findable
    def find_by_name(name)
      all.detect do |song|
        song.name == name
      end
    end

    def find_or_create_by_name(name)
      exists = self.find_by_name(name)
      exists ? exists : self.create(name)
    end
  end
end