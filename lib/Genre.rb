require_relative '../lib/concerns/findable.rb'

class Genre
    attr_accessor :name
    extend Concerns::Findable
    @@all = []
    def initialize(name)
        @name = name
        save
        @songs = []
    end
    def self.all
        @@all
    end
    def self.destroy_all
        @@all.clear
    end
    def save
        @@all << self
    end
    def self.create(name)
        genre = Genre.new(name)
        #@@all << genre
    end
    def songs
        @songs
    end
    def artists
        @artists = []
        Song.all.select {|song| song.genre == self}.each {|song| @artists << song.artist}
        @artists.uniq
    end
end