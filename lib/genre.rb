#require 'pry'
require "concerns/findable.rb"

class Genre

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
        if (Genre.all.include?(self) == false)
            @@all << self
        end   
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        new_genre = self.new(name)
        new_genre.save
        new_genre
    end

    def artists
        artists = []
        Song.all.each do |song|
            if (song.genre == self)
                artists << song.artist
            end
        end
        artists.uniq
    end
end

#Binding.pry