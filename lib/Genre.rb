class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs, :genre, :artist

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = (artist) if artist != nil
        self.genre = (genre) if genre != nil
        @songs = []
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def self.create(genre)
        genre = self.new(genre)
        @@all << genre
        genre
    end 

    def add_genre(genre)
        @songs << genre
    end   
       
    def songs
        @songs
    end

    def artists
        @songs.map {|song| song.artist}.uniq
    end
end


