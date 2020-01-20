class Song

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

    def self.find_by_name(name)
        self.all.find { |song| song.name  == name }
    end

    def self.find_or_create_by_name(name)
        foundSong = self.find_by_name(name)
        if(foundSong != nil)
            return foundSong
        else
            self.create(name)
        end
    end

end