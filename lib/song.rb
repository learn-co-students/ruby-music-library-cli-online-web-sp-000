class Song

    attr_accessor :name, :artist
    attr_reader :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        if artist
            self.artist = artist
        end

        if genre
            self.genre = genre
        end

    end

    def self.create(name)
        new_song = self.new(name)
        new_song.save

        new_song
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

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        unless genre.songs.include?(self)
            genre.songs << self
        end
    end

    def self.find_by_name(name)
        @@all.find { |song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        if self.find_by_name(name)
            self.find_by_name(name)
        else
            self.create(name)
        end
    end

    def self.new_from_filename(file)
        rows = file.split("-", 3)
        artist = rows[0].strip
        song = rows[1].strip
        genre = rows[2].split(".")[0].strip
        artist = Artist.find_or_create_by_name(artist)
        genre = Genre.find_or_create_by_name(genre)
        new_song = Song.create(song)
        new_song.artist = artist
        new_song.genre = genre
        new_song
    end

    def self.create_from_filename(filename)
        new_song = new_from_filename(filename)
    end
end