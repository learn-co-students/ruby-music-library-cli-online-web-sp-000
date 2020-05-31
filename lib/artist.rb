require "pry"
class Artist
    extend Concerns::Findable

    attr_accessor :name, :songs

    @@all = []

    def self.all
        @@all
    end

    def self.destroy_all
        @@all = []
    end

    def self.create(name)
        artist = self.new(name)
        artist.save
        artist
    end

    def initialize(name)
        @name=name
        @songs = []
    end

    def save
        self.class.all << self
    end

    def genres

        songs.collect {|s| s.genre}.uniq
    end

    def add_song(song)
        if !self.songs.include?(song)
            self.songs << song
        end
        if !song.artist    
            song.artist = self
        end
    end
    
end