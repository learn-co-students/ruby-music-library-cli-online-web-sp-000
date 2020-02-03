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

    def self.create_by_name(song_name)
        self.create(song_name)
    end

    def self.find_or_create_by_name(song_name)
        find_by_name(song_name) || create_by_name(song_name)
    end

end

