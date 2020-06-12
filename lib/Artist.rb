require 'pry'
require_relative "../lib/concerns/modules.rb"

class Artist
    extend Concerns::Findable
    attr_accessor :name, :songs, :genre
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all #refactor
        @@all
    end

    def save #refactor
        @@all << self
    end

    def self.create(name) #refactor
        song = self.new(name)
        song.save
        song
    end

    def self.destroy_all #refactor
        @@all = []
    end

    #adds an instance of a song, for example <Songs:38283, @artist, @genre, @name>
    #checks if the song has an artist (eg. the artist name is not nil)
    #assigns self as the artist (the current artist instance, which includes @name, and @song array)
    #pushes song into artist's @song array if it doesnt already include that song
    def add_song(song)
        song.artist = self unless song.artist 
        @songs << song unless @songs.include?(song)
    end
    
    def genres
        self.songs.collect {|song| song.genre}.uniq
    end

end
