require 'pry'

class Artist
    attr_accessor :name
    attr_reader :song

    extend Concerns::Findable

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        save
        #Initializes with a name, an empty songs array, and calls the save method
    end 

    def self.all
        @@all
        #The All array, duplicated in environment module Findable? I think.
    end 
    
    def save
        @@all << self
        #The Save command, essentially
    end 

    def self.destroy_all
        @@all.clear
        #Clears everything saved in the array
    end 

    def self.create(name)
        artist = Artist.new(name)
        artist
        #Creates and returns a new artist based on a name argument, returns the artist
    end 
    
    def songs
        @songs
        #The Songs array
    end 

    def add_song(song)
        if song.artist == nil 
            song.artist = self
        end 
        if !@songs.include?(song)
            @songs << song
        end 
        #If the artist property is empty and the songs array doesn't include the song
        #Adds a song to the artist's songs array and sets the song's artist to the artist instance
    end

    def genres
        genres = []
        songs.each do |song|
            genres << song.genre
        end 
        #Pushes all genres from the songs array by the artist into the genres array
        genres.uniq
        #Removes duplicates! So that the array returned is only unique genres.
    end 
end
