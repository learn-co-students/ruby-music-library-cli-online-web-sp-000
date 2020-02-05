require 'pry'

class Song
    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist=(artist) if artist != nil
        self.genre=(genre) if genre != nil 
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

    def self.create(song)
        created_song = self.new(song)
        created_song.save
        created_song
    end
    
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
        # binding.pry
    end 

    def genre=(genre)
        @genre = genre 
        genre.songs << self if !genre.songs.include?(self)
    end
    
    def self.find_by_name(song_name)
        self.all.detect{|song| song.name == song_name}
    end

    def self.find_or_create_by_name(name)
        find_by_name(name) || create(name)
    end

    def self.new_from_filename(file_name)

        parts = file_name.split(" - ")
        artist_name = parts[0]
        song_name = parts[1]
        genre_name = parts[2].gsub(".mp3", "")
       
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)

        self.new(song_name, artist, genre)
        # binding.pry
    end

    def self.create_from_filename(file_name)
        new_from_filename(file_name).save 
    end

end

