class Artist
    extend Concerns::Findable
    attr_accessor :name, :song
    
    @@all = []
    def initialize(name)
        @name = name
        @song = song
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
        artist.save
        artist
    end

    def add_song (song)
        song.artist = self unless song.artist !=nil
       @songs << song unless @songs.include?(song)
    end

    def songs        
        @songs
    end

    def genres
       collection = @songs.collect do |eachGenre|
            eachGenre.genre 
        end
        collection.uniq
    end
   
    
end