require 'pry'

class Song
    attr_accessor :name, :artist

    @@all = []

    # Make an optional second argument
    # The optional argument will be?
    def initialize(name, artist = nil)
        @name = name
        self.artist=(artist)
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

    def self.create(song)
        created_song = self.new(song)
        created_song.save
        created_song
    end

    def artist=(artist)
        @artist = artist
    end 

end