class Genre 
    extend Concerns::Findable
    @@all = []

    attr_accessor :name
    def initialize(name)
        @name = name 
        @@all << self 
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

    def self.create(genre)
        song = Genre.new(genre)
        song.save 
        song 
    end 

    def songs 
        @songs 
    end 

    def artists
        songs.collect{ |s| s.artist }.uniq
    end
end 
