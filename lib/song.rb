require "pry"

class Song
    extend Concerns::Findable

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def self.all
        @@all
    end

    def self.destroy_all
        @@all = []
    end

    def self.create(name)
        song = self.new(name)
        song.save
        song
    end

    def self.new_from_filename(filename)
        parsed_name = filename.split(" - ")
        artist = Artist.find_or_create_by_name(parsed_name[0])
        song_name = parsed_name[1]
        genre_name = parsed_name[2].split(".")[0]
        genre = Genre.find_or_create_by_name(genre_name)
        new_song = self.new(song_name, artist, genre)
        new_song
    end

    def self.create_from_filename(filename)
        @@all << self.new_from_filename(filename)
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
    end

    def initialize(name, artist = nil, genre = nil)
        @name=name
        if artist
            self.artist = artist
        end
        if genre
            self.genre = genre
        end
    end

    def save
        self.class.all << self
    end
    
end