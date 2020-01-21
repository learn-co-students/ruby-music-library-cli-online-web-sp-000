require "./lib/concerns/findable"

class Song

    extend Concerns::Findable

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        
        if(artist != nil)
            self.artist = artist
        end

        if(genre != nil)
            self.genre = genre
        end

        self.save
    end
    
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        if !genre.songs.include?(self) 
            genre.songs << self
        end
    end
    
    def self.all
        @@all
    end

    def self.destroy_all
        @@all = Array.new()
    end

    def save
        @@all << self
    end

    def self.create(name)
        Song.new(name)
    end

    def self.new_from_filename(filename)
        parts = filename.split(" - ")
        artist_str = parts[0]
        name_str = parts[1]
        genre_str = parts[2].gsub(".mp3", "")
        artist = Artist.find_or_create_by_name(artist_str)
        genre = Genre.find_or_create_by_name(genre_str)
        Song.new(name_str, artist, genre)
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename)
    end

end