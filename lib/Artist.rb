require 'pry'
class Artist
    extend Concerns::Findable

    attr_accessor :artist, :songs, :name, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = (artist) if artist != nil
        self.genre = (genre) if genre != nil
        @songs = []
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    # creates new artist instance
    def self.create(artist)
        artist = self.new(artist)
        @@all << artist
        artist
    end 

    # adds new song to list of artist's songs unless artist is already listed
    def add_song(song)
       #binding.pry
        song.artist = self unless song.artist
        @songs << song unless @songs.include?(song)
    end
    
    def songs 
        @songs
    end

    # all genres associated w/ artist (duplicates removed)
    def genres
        #binding.pry
        @songs.map {|song| song.genre}.uniq
    end
end