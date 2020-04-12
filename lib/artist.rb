class Artist
    extend Concerns::Findable
    
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.create(name)
        new_artist = self.new(name)
        new_artist.save
        
        new_artist
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

    def songs
        @songs
    end

    def add_song(song)
        if song.artist == nil
            song.artist = self
        end

        unless @songs.include?(song)
            @songs << song
        end
    end

    def genres
        genre_list = self.songs.collect { |song| song.genre}
        genre_list.uniq
    end
end