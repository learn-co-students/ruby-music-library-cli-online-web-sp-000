require "./lib/concerns/findable"
class Artist
    
    extend Concerns::Findable

    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []  
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all = Array.new()
    end

    def save
        @@all << self
    end

    def self.create(name)
        a = Artist.new(name)
        a.save
        a
    end
    
    def add_song(song)
        if(song.artist == nil)
            song.artist = self
            songs << song
        end
    end

    def genres
        Song.all.find_all { |song| song.artist == self }.map(&:genre).uniq
    end
   
end