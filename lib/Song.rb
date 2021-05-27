class Song
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name 
        self.artist = artist if artist
        self.genre = genre if genre
        save 
    end 

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
    end 

    def save
        @@all << self 
    end 

    def self.all
        @@all 
    end 

    def self.create(name)
        self.new(name)
    end 

    def self.destroy_all
        self.all.clear
    end 

    def self.find_by_name(name)
        self.all.find {|song| song.name == name}
    end 

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end 

    def self.new_from_filename(filename)
        file_array = filename.split(" - ")
        artist = Artist.find_or_create_by_name(file_array[0])
        genre = Genre.find_or_create_by_name(file_array[2].split(".mp3").join)
        self.new(file_array[1], artist, genre)

        # From the solution: 
        # artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")
        # artist = Artist.find_or_create_by_name(artist_name)
        # genre = Genre.find_or_create_by_name(genre_name)
        # new(song_name, artist, genre)
    end 

    def self.create_from_filename(filename)
        self.new_from_filename(filename)
    end 
end 