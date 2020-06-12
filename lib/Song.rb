require 'pry'
require_relative "../lib/concerns/modules.rb"

class Song
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name  
        #if there is no artist entered, then set artist through the artist= method
        if artist != nil 
            self.artist=(artist) 
        end
        if genre != nil 
            self.genre=(genre) 
        end
    end

    #allows user to input artist instance and uses the add_song method on it, adding this song instance to it
    #that automatically checks whether or not this song is already in the artist's array and adds it if not
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include? self
    end

    def self.all #refactor
        @@all 
    end

    def save #refactor
        @@all << self
    end

    def self.create(name) #refactor
        song = self.new(name)
        song.save
        song
    end

    def self.destroy_all #refactor
        @@all = []
    end
  
    def self.find_by_name(name)
        self.all.find {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
       if Song.find_by_name(name) == nil 
        Song.create(name)
       else
        Song.find_by_name(name)
       end
    end

    def self.new_from_filename(filename)
        name_array = filename.split(' - ')

        n_artist = name_array[0]
        n_name = name_array[1]
        n_genre = name_array[2].split('.')[0]
        
        n_song = Song.new(n_name)
        n_song.artist = Artist.find_or_create_by_name(n_artist)
        n_song.genre = Genre.find_or_create_by_name(n_genre)
        n_song
    end

    def self.create_from_filename(filename)
        n_song = Song.new_from_filename(filename)
        n_song.save
    end
end