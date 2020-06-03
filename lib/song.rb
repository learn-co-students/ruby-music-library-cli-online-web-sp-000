class Song
    attr_accessor :name 
    attr_reader :artist, :genre

    @@all =[]

    def initialize(name, artist = nil, genre = nil)
        @name = name
        if artist != nil
            self.artist = artist
        end
        if genre != nil
            self.genre = genre
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

    def self.create(song_name)
        new_song = Song.new(song_name)
        @@all << new_song
        new_song
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self) 
    end

    def self.find_by_name(name)
        @@all.detect {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
       find_by_name(name) || create(name)
    end

    def self.new_from_filename(file)
        artist, song, genre_name = file.split(" - ")
        fixed_name = genre_name.gsub(".mp3", '')
        artist = Artist.find_or_create_by_name(artist)
        genre = Genre.find_or_create_by_name(fixed_name)
        new(song, artist, genre)
    end

    def self.create_from_filename(file)
        new_from_filename(file).save
    end
end