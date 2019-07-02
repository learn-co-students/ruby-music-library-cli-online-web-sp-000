class Genre

    extend Concerns::Findable

    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def self.destroy_all
        self.all.clear
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
        song.genre = self unless song.genre == self
        @songs << song unless @songs.include?(song)
    end

    def artists
        songs.collect{|song| song.artist}.uniq
    end
end