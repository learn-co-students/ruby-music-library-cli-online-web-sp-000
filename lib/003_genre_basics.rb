class Genre
    
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

    def self.create(mygenre)
        self.new(mygenre).save
        self
    end

    def add_songGen(song)
        if @songs.include?(song)==false
            @songs << song
        end
    end

    def artists
        @saveart = []
        @songs.map do |song|
            @saveart << song.artist if @saveart.include?(song.artist) == false
        end
        @saveart
    end
end
