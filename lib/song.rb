class Song

    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist=(artist)
        self.genre=(genre)
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
        new_song = Song.new(name)
        new_song.save
        new_song
    end

    def artist
        @artist
    end

    def artist=(artist)
        if self.artist.nil? && artist.is_a?(Artist)
            @artist = artist
            artist.add_song(self)
        end
    end

    def genre=(genre)
        if self.genre.nil? && genre.is_a?(Genre)
            @genre = genre
            genre.add_song(self)
        end
    end

    def self.find_by_name(name)
        @@all.find do |song|
            song.name == name
        end
    end

    def self.find_or_create_by_name(name)
        if all.include?(Song.find_by_name(name))
            return Song.find_by_name(name)
        else
            new_song = Song.create(name)
            return new_song
        end
    end

    def self.new_from_filename(file_name)
        name = file_name.split(" - ")[1]
        artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
        genre_string = file_name.split(" - ")[2].to_s
        genre = Genre.find_or_create_by_name(genre_string[0, genre_string.length - 4])
        new_song = Song.new(name, artist, genre)
        new_song
    end

    def self.create_from_filename(file_name)
        new_song = Song.new_from_filename(file_name)
        new_song.save
        new_song
    end

end