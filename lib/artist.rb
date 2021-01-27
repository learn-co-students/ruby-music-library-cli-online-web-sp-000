require_relative '../lib/concerns/findable'

class Artist 

    attr_accessor :name

    extend Concerns::Findable

    @@all = []

    def initialize(name)
        @name = name
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
        #@name = name
        #@@all << self  
        #return self
        artist = self.new(name)
        artist.save
        artist
    end

    def songs
        @songs
    end

    def add_song(song)
        #needs to be called as two separate conditionals

        if song.artist == nil
            song.artist = self 
        end
        
        if @songs.include?(song)
            nil
        else
            songs << song
        end
    end

    def genres     
        @genre_array = []
        @songs.collect do |song|
            song.genre
        end.uniq
    end

end