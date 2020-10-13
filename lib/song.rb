class Song
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        if artist != nil
            self.artist=(artist)
        end
        if genre != nil
            self.genre=(genre)
        end
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
        new_song = Song.new(name)
        new_song.save
        new_song
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
    end

    def self.find_by_name(name)
        @@all.detect{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        result = self.find_by_name(name)
        if result == nil
            self.create(name)
        else
            result
        end
    end

    def self.new_from_filename(file)
        file = file.split(" - ")
        artist = Artist.find_or_create_by_name(file[0])
        genre = Genre.find_or_create_by_name(file[2].chomp(".mp3"))
        song = self.new(file[1], artist, genre)
    end

    def self.create_from_filename(file)
        new_from_filename(file).save
    end
end