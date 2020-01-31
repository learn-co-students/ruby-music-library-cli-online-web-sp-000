require 'pry'

class Artist
    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
       @@all  
    end

    def self.destroy_all
        all.clear
    end

    def save
        @@all << self 
    end

    def self.create(artist)
        created_artist = self.new(artist)
        created_artist.save 
        created_artist
    end

    # Create a 'songs' property that is set to an empty array
    # Create a song= method and make the instance var equal to an array
    def song 
        @songs = []
    end
end