class Song
    extend Concerns::Findable

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end

    def self.all
        @@all
    end

    def self.destroy_all
        all.clear
    end


    def save
        self.class.all << self
        self
    end

    def create(name)
        #binding.pry
        new(name).save
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
    end

    def self.new_from_filename(filename)
        parts = filename.split(" - ")
        artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        song = Song.find_or_create_by_name(song_name)
        #binding.pry
        
        new(song, artist, genre)
    end
    



    def self.create_from_filename(filename)
        new_from_filename(filename).save
    end
end