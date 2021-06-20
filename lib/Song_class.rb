class Song
    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize (name, artist=nil, genre=nil)
        @name = name
        #@@all << self
        self.artist=(artist) if artist != nil 
        self.genre=(genre) if genre != nil
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
        song = self.new(name)
        song.save
        song
    end 

    def artist
        @artist
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre
        @genre
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.find_by_name(name)
        @@all.detect do |song|
            song.name == name
        end
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(file)
        song_info = file.chomp(".mp3").split(" - ")
        song = Song.new(song_info[1])
        song.artist = Artist.find_or_create_by_name(song_info[0])
        song.genre = Genre.find_or_create_by_name(song_info[2])
        song
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end

    

end