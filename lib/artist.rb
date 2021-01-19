class Artist 
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

    def self.destroy_all
        self.all.clear
    end

    def save 
        @@all << self
    end

    def self.create(name)
        created_artist = self.new(name)
        created_artist.save
        created_artist
    end

    def songs 
        @songs
    end

    def add_song(song)
        if !song.artist
        song.artist = self
        end
        if !self.songs.include?(song)
        self.songs << song
        end
    end

    def genres
        self.songs.collect {|song| song.genre}.uniq
    end
end