class Song
    attr_reader :name, :artist, :genre
    
    @@all = []
    def initialize(name, song_artist = nil, song_genre = nil)
        @name = name
        save
        artist = song_artist
        genre = song_genre
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
        song = Song.new(name)
        song
    end
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end
    def genre=(genre)
        @genre = genre
        @genre
    end
end