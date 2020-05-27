# require 'pry'
# require './genre.rb'
# require './artist.rb'
require "concerns/findable.rb"

class Song

    attr_accessor :name
    attr_reader :artist, :genre
    extend Concerns::Findable

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        if (artist != nil)
            self.artist = artist
        end
        if (genre != nil)
            self.genre = genre
        end
        self.save
    end

    def self.all
        @@all
    end

    def save
        if (Song.all.include?(self) == false)
            @@all << self
        end    
    end

    def self.destroy_all
        @@all.clear
    end
    
    def self.create(name, artist=nil, genre=nil)
        new_song = self.new(name, artist, genre)
        new_song.save
        new_song
    end

    def artist=(artist)
        if (artist != nil)
            @artist = artist
            @artist.add_song(self)
        end
    end

    def genre=(genre)
        if (genre != nil && self.genre != genre)
            @genre = genre
            @genre.songs << self
        end
    end

    def self.new_from_filename(filename)
        split_arr = filename.chomp(".mp3").split(" - ")
        
        new_artist = Artist.find_or_create_by_name(split_arr[0])
        new_genre = Genre.find_or_create_by_name(split_arr[2])
        new_song = self.new(split_arr[1], new_artist, new_genre)
        new_song
    end

    def self.create_from_filename(filename)
        new_song = self.new_from_filename(filename)
    end
end

# Binding.pry