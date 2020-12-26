
class Genre
    extend Concerns::Findable

attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def artists
        @songs.collect {|x| x.artist}.uniq
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

    def self.create(name)
        genre = Genre.new(name)
        genre.save
        genre
    end
    
end