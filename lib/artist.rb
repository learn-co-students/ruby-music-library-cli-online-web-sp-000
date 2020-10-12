class Artist
    extend  Concerns::Findable

    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        @@all << self
    end

    def self.create(artist)
        new_artist = Artist.new(artist)
        new_artist.save
        new_artist
    end

    
    def add_song(song)
        song.artist = self if !song.artist
        self.songs << song if !self.songs.include? song
    end

    def genres
        self.songs.collect {|song| song.genre}.uniq
    end

    
end