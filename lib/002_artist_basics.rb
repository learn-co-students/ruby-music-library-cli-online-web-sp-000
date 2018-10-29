class Artist
    
    @@all = []

    attr_accessor :name
    attr_reader :songs
    
    def initialize(name)
        @name = name
        @songs = []
    end
    
    def save
        @@all << self
    end
    
    def self.all
    @@all
    end

    def self.destroy_all
        @@all = []
    end

    def self.create(myartist)
        self.new(myartist).save
        self
    end

    def add_song(song)
        if song.artist == nil
            song.artist = self
        end
        if @songs.include?(song)==false
            @songs << song
        end
    end

    def genres
        @saveme = []
        @songs.map do |song|
            @saveme << song.genre if @saveme.include?(song.genre) == false
        end
        @saveme
    end

end
