class Genre
    attr_accessor :name, :songs
    @@all = []

    extend Concerns::Findable

    def initialize(name)
        @name = name 
        @songs = []
        save 
    end 

    def self.all
        @@all
    end

    def save 
        @@all << self
    end 

    def self.create(name)
        genre = self.new(name)
        genre
    end 

    def songs
        Song.all.select {|song| song.genre == self}
    end 

    def artists
        songs.collect {|song| song.artist}.uniq
    end 

    def self.destroy_all
        self.all.clear
    end 
end 