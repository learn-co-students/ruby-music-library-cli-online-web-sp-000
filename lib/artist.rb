class Artist
    extend Concerns::Findable

    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def songs
        @songs
    end

    def genres
        songs.map{|song| song.genre}.uniq
    end

    def add_song(song)
        song.artist = self unless song.artist
        songs << song unless songs.include?(song)
    end
end 