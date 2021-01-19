require 'pry'

class Song
    attr_accessor :name, :artist, :genre
    extend Concerns::Findable

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist != nil
        self.genre = genre if genre != nil
    end

    def artist=(artist)
        @artist = artist
        @artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        if !genre.songs.include?(self)
            genre.songs << self
        end
    end

    def save
        @@all << self 
    end

    def self.create(name)
        created_song = self.new(name)
        created_song.save
        created_song
        
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def self.find_by_name(name)
        @@all.detect do |song|
            if song.name == name
                self 
            end
        end
    end

    def self.find_or_create_by_name(name)
         found = self.find_by_name(name)
         if !found
            created = self.create(name)
            created
         else
            found
         end
    end

    def self.new_from_filename(filename)
        song_name = filename.split(" - ")[1]
        artist_name = filename.split(" - ")[0]
        genre_name = filename.split(" - ")[2].delete_suffix(".mp3")
        song=Song.find_or_create_by_name(song_name)
        song.artist=Artist.find_or_create_by_name(artist_name)
        song.genre=Genre.find_or_create_by_name(genre_name)
        song
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end
end