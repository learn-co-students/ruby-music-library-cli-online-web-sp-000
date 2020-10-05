class Genre
    attr_accessor :name
    extend Concerns::Findable

    @@all = []

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

    def self.destroy_all
        @@all.clear
    end 

    def self.create(name)
        genre = Genre.new(name)
        genre
    end 
    
    def songs
        @songs
    end 

    def artists
        artists = []
        songs.each do |song|
            artists << song.artist
        end 
        artists.uniq
    end 
end 