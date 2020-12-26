require 'pry'
class Song

attr_accessor :name
attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name 
        self.artist = artist unless artist == nil
        self.genre = genre unless genre == nil
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include? (self)
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self) 
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        song = Song.new(name)
        song.save
        song
    end

    def self.find_by_name(song_name)
        @@all.find {|x| x.name == song_name}
    end

    def self.find_or_create_by_name(name)
       find_by_name(name) || create(name)
        # if find_by_name(name)
        #     find_by_name(name)
        # else
        #     create(name)
        # end
    end

    def self.new_from_filename(filename)
        song_split = filename.split(" - ")
        # binding.pry
        artist_name = song_split[0]
        genre_name = song_split[2].delete(".mp3")
        song_name = song_split[1]

        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)

        song = Song.new(song_name, artist, genre)

    end

    def self.create_from_filename(filename)
        @@all << self.new_from_filename(filename) 
    end
    
end