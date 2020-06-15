class Genre
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        save
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
        artist = Artist.new(name)
        
    end
    def songs
        @songs
    end
end