require 'pry'

class Song
    attr_accessor :name
    attr_reader :artist, :genre
    
    extend Concerns::Findable

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist 
        self.genre = genre if genre
        #if artist != nil
         #   self.artist = artist
        #end 
        #if genre != nil
         #   self.genre = genre
        #end 
        #Refactored to be cleaner but these are basically the same as above.
        save
    end 

    def self.all
        @@all
    end 
    
    def save
        @@all << self
    end 

    def self.destroy_all
        @@all.clear
    end 

    def self.create(name)
        song = Song.new(name)
        song
    end 

    
    def artist=(artist)
        @artist = artist 
        artist.add_song(self)
        #Theoretically should create an artist instance based on the name?
        #And save the song to that artist's songs array thingie.
    end 

    def genre=(genre)
        @genre = genre
        if !@genre.songs.include?(self)
        @genre.songs << self
        end 
    end 

    def self.new_from_filename(file)
        file_array = file.gsub(".mp3", "").split(" - ")
        #Gsub is better than delete, takes two arguments, first one the material to delete, second 
        artist = file_array[0]
        name = file_array[1]
        genre = file_array[2]
        #Assigning variable names to each part of the array
        artist = Artist.find_or_create_by_name(artist)
        genre = Genre.find_or_create_by_name(genre)
        #Make the artist and genre portions Ruby objects before you invoke the song property
        song = Song.new(name, artist, genre)

    end 

    def self.create_from_filename(file)
        new_from_filename(file)
        #Since the Song.new automatically saves there's no need to save it here.
    end 

end 
