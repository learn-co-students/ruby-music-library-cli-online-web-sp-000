class Artist
    attr_accessor :name, :song

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
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

    def self.create(artist_name)
        new_artist = Artist.new(artist_name)
        @@all << new_artist
        new_artist
    end

    def songs
        @songs
    end

    def add_song(song)
        if song.artist == nil
            song.artist = self
        end
        unless songs.include?(song)
        @songs << song
        end
    end

    def genres
        songs.map(&:genre).uniq
    end
end
