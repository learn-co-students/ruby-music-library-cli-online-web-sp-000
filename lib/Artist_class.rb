require 'pry'
class Artist
    attr_accessor :name

    #extend Findable::ClassMethods
    extend Concerns::Findable

    @@all = []

    def initialize (name)
        @name = name
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

    def self.create(artist)
        artist = self.new(artist)
        artist.save
        artist
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        self.songs << song
        if song.artist == nil
            song.artist = self 
        end
    

    end

    def genres
        songs.collect {|song| song.genre}.uniq
    end
   
end