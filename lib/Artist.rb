require_relative '../lib/concerns/findable.rb'

class Artist
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
        artist = Artist.new(name)
        
    end
    def songs
        @songs
    end
    def add_song(song)
        if song.artist == nil
            song.artist = self
            if @songs.find {|each_song| each_song == song} 

            else
                #song is not found in @song array
                @songs << song
            end
            
        else
            #artist already has song
        end
    end
    def genres
        @genres = []
        Song.all.select {|song| song.artist == self}.each {|song| @genres << song.genre}
        @genres.uniq
    end
end