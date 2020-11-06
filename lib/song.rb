class Song
    extend Concerns::Findable

    attr_accessor :name, :genre
    attr_reader :artist
    
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
        save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def artist=(artist)
        @artist = artist
        @artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        @genre.add_song(self)
    end

    def self.new_from_filename(filename)
        song_name = filename.split(" - ")[1]
        artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
        genre = Genre.find_or_create_by_name(filename.split(" - ")[2].split(".")[0])
        self.new(song_name, artist, genre)
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename)
    end

end