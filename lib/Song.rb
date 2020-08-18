class Song
    extend Concerns::Findable

    attr_accessor :name, :artist, :genre, :filename, :song, :genres

    @@all = []
    # initializes with name, optional artist/genre, assigns artist/genre if none currently assigned
    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = (artist) if artist != nil
        self.genre = (genre) if genre != nil
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    # clears @@all array
    def self.destroy_all
        self.all.clear
    end

    # creates new song from song name
    def self.create(name)
        name = self.new(name)
        @@all << name
        name
    end 

    # associates artist instance with song
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    # associates genre with song, adds to list of genres unless already listed in genres array
    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    # creates a new song instance from filename (called from musicimporter.rb)
    def self.new_from_filename(filename)
        artist_name, song_name, genre_name = filename.chomp(".mp3").split(" - ")
        song = self.new(song_name)
        song.artist = Artist.find_or_create_by_name(artist_name)
        song.genre = Genre.find_or_create_by_name(genre_name)
        song
    end

    # same as new_from_filename except file is now saved
    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end
end