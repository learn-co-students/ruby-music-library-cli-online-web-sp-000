require "pry"

class Genre


    attr_accessor :name, :songs
    @@all = []


    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
            self.new(name)
            @@all << self
            self
        #if !self.all.include?(name)
        end

        def add_song(song)
            song.genre = self if song.genre == nil
            self.songs << song if self.songs.include?(song) == false
          end


    def self.all
        @@all
    end

    def new_song(name, genre)
        Song.new(name, artist, self)
      end

#binding.pry
       def artists
        binding.pry 
        songs.collect do |song| 
            if song = nil
            song.artist = artist 
            song.artist 
                                                                               
    end
end
end
end
