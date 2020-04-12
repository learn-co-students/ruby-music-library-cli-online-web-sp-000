class Genre
    extend Concerns::Findable

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.create(name)
        new_genre = self.new(name)
        new_genre.save

        new_genre
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

    def artists
        artist_list = self.songs.collect { |song| song.artist}
        artist_list.uniq
    end
end