require 'pry'
require_relative '../lib/concerns/findable'

class Song

    attr_accessor :name, :artist, :genre

    extend Concerns::Findable
    
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        if artist != nil 
            self.artist = artist
        end
        if genre != nil
            self.genre = genre
        end
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
        #Make sure to call the required argument on self.new
        song = self.new(name)
        song.save
        song
    end

    def artist=(artist)
        @artist = artist 
        self.artist.add_song(self)
    end

    def genre 
        @genre 
    end

    def genre=(genre)
        @genre = genre
        if @genre.songs.include?(self)
            nil
        else
            @genre.songs << self
        end
    end

    def self.new_from_filename(filename)
        array = filename.split(" - ")

        song_name = array[1]
        artist_name = array[0]
        genre_name = array[2].chomp(".mp3")
        
        artist = Artist.find_or_create_by_name(artist_name)
        #Make sure to reference Genre and not Artist
        genre = Genre.find_or_create_by_name(genre_name)
        self.new(song_name, artist, genre)
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end

end