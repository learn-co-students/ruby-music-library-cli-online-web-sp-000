require_relative '../lib/concerns/findable.rb'

class Song
    extend Concerns::Findable
    attr_reader :artist, :genre
    attr_accessor :name
    @@all = []
    def initialize(name, song_artist = nil, song_genre = nil)
        @name = name
        save
        if song_artist == nil

        else
            self.artist = song_artist
        end
        if song_genre == nil

        else
            self.genre = song_genre
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
        song = Song.new(name)
        song
    end
    def artist=(artist)
        @artist = artist

        artist.add_song(self)
        #binding.pry
    end
    def genre=(genre)
        @genre = genre
        if genre.songs != nil && genre.songs.include?(self)
        
        else
            genre.songs << self
        end
        
        if Genre.all.include?(genre)
        else
            
            genre.save
        end
        #binding.pry

    end
    def self.find_by_name(name)
        @@all.find {|song| song.name == name}
    end
    def self.find_or_create_by_name(name)
        if  self.find_by_name(name)
            self.find_by_name(name)
        else
            self.create(name)
        end
        
    end
    def self.new_from_filename(file)
        #binding.pry
        @strip_file = file.split(".mp3")[0].split(" - ")
        @strip_song = @strip_file[1]
        @strip_artist = @strip_file[0]
        @strip_genre = @strip_file[2]        
        song = self.find_or_create_by_name(@strip_song)
        @name = @strip_song
        newArtist = Artist.find_or_create_by_name(@strip_artist)
        newGenre = Genre.find_or_create_by_name(@strip_genre)
        song.artist = newArtist
        song.genre = newGenre
        
        #binding.pry
        song
    end
    def self.create_from_filename(file)
        @strip_file = file.split(".mp3")[0].split(" - ")
        @strip_song = @strip_file[1]
        @strip_artist = @strip_file[0]
        @strip_genre = @strip_file[2] 
        song = self.new_from_filename(file)
    end
    def import(files)
        
    end
end