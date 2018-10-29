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

#add_song
#assigns the current artist to the song's 'artist' property (song belongs to artist)
#does not assign the artist if the song already has an artist
#adds the song to the current artist's 'songs' collection
#does not add the song to the current artist's collection of songs if it already exists therein
    def add_song(song)
        if song.artist == nil
            song.artist = self
        end
        if @songs.include?(song)==false
            @songs << song
        end
    end

end
