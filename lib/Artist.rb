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

    def song 
        @songs = []
    end

    def add_song(song)
        song.artist = self if song.artist == nil
        # Add song the song to the artist's songs array
        song.artist.songs << song
        # does not add the song to the current artist's collection of songs if it already exists therein
        # If the song already exists in the artist songs array don't add the song to the artist's songs array 

        binding.pry
    end

end