require 'pry'

require_relative './artist.rb'

class Song

    attr_accessor :name, :artist, :genre, :filename

    attr_reader :song

    extend Concerns::Findable 

    @@all = []

    #mass assignment and metaprogramming for optional value?
    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist=(artist) if artist
        self.genre=(genre) if genre
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def self.destroy_all
        self.all.clear
    end

    def count
        self.all.size
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
    end

    #is filename used? or does it not matter? test with pry
    def self.new_from_filename(name)
        file_name = name.chomp('.mp3')
        file_info = file_name.split(' - ')
        
        song_artist = Artist.find_or_create_by_name(file_info[0])
        song_genre = Genre.find_or_create_by_name(file_info[2])
        new(file_info[1], song_artist, song_genre)
    end

    def self.create_from_filename(name)
        new_from_filename(name).tap {|s| s.save}
    end
end

# last full test passed 010