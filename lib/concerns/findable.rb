module Concerns
  module Findable
    def create(name)
      song = Song.new(name)
      @@all << song
      song
    end

    def find_by_name(name)
      self.all.find do |song|
        song.name == name
      end
    end

    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end
  end

end
