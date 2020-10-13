class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs
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
        new_genre = Genre.new(name)
        new_genre.save
        new_genre
    end

    def add_song(song)
        if song.genre == nil
            song.genre == self
        end
        if !songs.include?(song)
            @songs << song
        end
    end

    def artists
        result = []
        @songs.each do |song|
            if !result.include?(song.artist)
                result << song.artist
            end
        end
        result
    end
end