class Song
    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end
        

    def artist=(artist)
        @artist = artist
        artist.add_song(self)        
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self if !genre.songs.include? self
    end
          

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        @@all << self
    end

    def self.create(song)
        new_song = Song.new(song)
        new_song.save
        new_song
    end

    def self.find_by_name(song_name)
        all.find {|song| song.name == song_name}
    end

    def self.find_or_create_by_name(song_name)
        find_by_name(song_name) || create(song_name)
    end

    def self.new_from_filename(file_name)
        artist, song, genre = file_name.split(" - ")
        genre = genre.gsub(".mp3", "")
        
        artist = Artist.find_or_create_by_name(artist)
        genre = Genre.find_or_create_by_name(genre)

        Song.new(song, artist, genre)
    end

    def self.create_from_filename(file_name)
        new_song = new_from_filename(file_name)
        new_song.save
    end
end