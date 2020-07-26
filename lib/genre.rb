class Genre
    extend Concerns::Findable

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def name
        @name
    end

    def name=(name)
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

    def self.create(name)
        genre = Genre.new(name)
        genre.save
        genre
    end

    def songs
        @songs
    end

    def add_song(song)
        if !@songs.include?(song)
            @songs << song
        end
    end

    def artists
        artists = songs.map do |song|
            song.artist
        end
        artists.uniq
    end
end