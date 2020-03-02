require 'pry'

class Artist
    extend Concerns::Findable
    
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
        # If the song already exists in the artist songs array don't add the song to the artist's songs array 
        song.artist.songs.uniq!
        # binding.pry
    end

    def genres
        # Return an array of genres for all of the artist's songs (artist has many genres through songs)
        songs.map{|song| song.genre}.uniq
        # does not return duplicate genres if the artist has more than one song of a particular genre 
        # if the artist has more than one song of a particular genre it does not return duplicate genres
    end 

end