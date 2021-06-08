require 'pry'

class Song
    extend Concerns::Findable
    extend Memorable::ClassMethods
    include Memorable::InstanceMethods
    
    attr_accessor :name 
    attr_reader :artist, :genre
    
    @@all = []
  
    def initialize(name, artist = nil, genre = nil)
      @name = name
      self.artist = artist if artist
      self.genre = genre if genre
      save
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end
    
    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.new_from_filename(filename)
        # split by song name, artist, and genre
        name_array = filename.split(" - ")
        artist_name, song_name, genre_name = name_array[0], name_array[1], name_array[2].gsub(".mp3", "")
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        new(song_name, artist, genre)
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename)
    end
end