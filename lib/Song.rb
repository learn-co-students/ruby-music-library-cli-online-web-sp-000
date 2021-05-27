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

    def save
        @@all << self 
    end 

    def self.all
        @@all 
    end 

    def self.create(name)
        song = self.new(name)
        song
    end 

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
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
        song = self.new(file_array[1], artist, genre)
        song
    end 

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
    end 

    def self.destroy_all
        self.all.clear
    end 
end 