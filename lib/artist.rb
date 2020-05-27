#require 'pry'
#require './genre.rb'
#require './song.rb'
require "concerns/findable.rb"

class Artist

    attr_accessor :name, :songs
    extend Concerns::Findable

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def save
        if (Artist.all.include?(self) == false)
            @@all << self
        end   
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        new_artist = self.new(name)
        new_artist.save
        new_artist
    end

    def add_song(song)
        if (song.artist != self)
            song.artist = self
            self.songs << song
        end
    end

    def genres
        genres = []
        Song.all.each do |song|
            if (song.artist == self)
                genres << song.genre
            end
        end
        genres.uniq
    end
end

#Binding.pry